<?php

/**
 * Implements hook_install_tasks_alter().
 */
function businessclass_install_tasks_alter(&$tasks, $install_state) {
	$install_configure_form = (array) $tasks['install_configure_form'];
	$install_import_locales_remaining = (array) $tasks['install_import_locales_remaining'];
	$install_finished = (array) $tasks['install_finished'];

	unset(
		$tasks['install_configure_form'],
		$tasks['install_import_locales_remaining'],
		$tasks['install_finished']
	);

	$tasks['businessclass_content'] = array(
	'display_name' => st('BusinessClass content'),
	'type' => 'normal',
	'run' => INSTALL_TASK_RUN_IF_NOT_COMPLETED,
	);

	$tasks['install_configure_form'] = $install_configure_form;
	$tasks['install_import_locales_remaining'] = $install_import_locales_remaining;
	$tasks['install_finished'] = $install_finished;
}

/**
 * Implements hook_form_FORM_ID_alter().
 *
 * Allows the profile to alter the site configuration form.
 */
function businessclass_form_install_configure_form_alter(&$form, $form_state) {
	$form['site_information']['site_name']['#default_value'] = 'BusinessClass';
    $form['#submit'][] = 'businessclass_profile_install_configure_form_submit';
}

/**
 * Forms API submit for the site configuration form.
 */
function businessclass_profile_install_configure_form_submit($form, &$form_state) {
	global $user;
	
	variable_set('site_name', $form_state['values']['site_name']);
	variable_set('site_mail', $form_state['values']['site_mail']);
	variable_set('date_default_timezone', $form_state['values']['date_default_timezone']);
	variable_set('site_default_country', $form_state['values']['site_default_country']);
	
	// Enable update.module if this option was selected.
	if ($form_state['values']['update_status_module'][1]) {
		module_enable(array('update'), FALSE);
		
		// Add the site maintenance account's email address to the list of
		// addresses to be notified when updates are available, if selected.
		if ($form_state['values']['update_status_module'][2]) {
		  variable_set('update_notify_emails', array($form_state['values']['account']['mail']));
		}
	}
  
	// We precreated user 1 with placeholder values. Let's save the real values.
	$account = user_load(1);
	$merge_data = array('init' => $form_state['values']['account']['mail'], 'roles' => !empty($account->roles) ? $account->roles : array(), 'status' => 1, 'timezone' => $form_state['values']['date_default_timezone']);
	user_save($account, array_merge($form_state['values']['account'], $merge_data));
	// Load global $user and perform final login tasks.
	
	db_insert('users_roles')
    ->fields(array('uid' => 1, 'rid' => '3'))
    ->execute();
	
	$user = user_load(1);
	user_login_finalize();

	// Record when this install ran.
	variable_set('install_time', $_SERVER['REQUEST_TIME']);
  
	theme_enable(array('businessclass', 'seven'));
	variable_set('theme_default', 'businessclass');
	variable_set('admin_theme', 'seven');
	variable_set('file_temporary_path', 'sites/default/files/tmp');
	
	drupal_set_message("More Than (just) Themes BusinessClass Easy Installation was a Success!");

}

function businessclass_content(&$install_state) {
	$sql_file=dirname(__FILE__).'/businessclass.sql';
	$count=businessclass_profile_import_sql($sql_file);
}

function businessclass_profile_import_sql($filename){
  global $databases;
  if (@mysql_connect($databases['default']['default']['host'], $databases['default']['default']['username'], $databases['default']['default']['password'])){
    mysql_select_db($databases['default']['default']['database']);
    $buffer='';
    $count=0;
    $handle = @fopen($filename, "r");
    if ($handle) {
      while (!feof($handle)) {
        $line = fgets($handle);
        $buffer.=$line;
        if(preg_match('|;$|', $line)){
          $count++;
          mysql_query($buffer);
          $buffer='';
        }
      }
      fclose($handle);
    }
    mysql_close();
  }
  return $count;
}