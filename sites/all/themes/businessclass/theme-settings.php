<?php
/**
 * Implements hook_form_FORM_ID_alter().
 *
 * @param $form
 *   The form.
 * @param $form_state
 *   The form state.
 */
function businessclass_form_system_theme_settings_alter(&$form, &$form_state) {

  $form['mtt_settings'] = array(
    '#type' => 'fieldset',
    '#title' => t('MtT Theme Settings'),
    '#collapsible' => FALSE,
	'#collapsed' => FALSE,
  );

  $form['mtt_settings']['breadcrumb'] = array(
    '#type' => 'fieldset',
    '#title' => t('Breadcrumb'),
    '#collapsible' => TRUE,
	'#collapsed' => TRUE,
  );
  
  $form['mtt_settings']['breadcrumb']['breadcrumb_display'] = array(
    '#type' => 'checkbox',
    '#title' => t('Show breadcrumb'),
  	'#description'   => t('Use the checkbox to enable or disable Breadcrumb.'),
	'#default_value' => theme_get_setting('breadcrumb_display', 'businessclass'),
    '#collapsible' => TRUE,
	'#collapsed' => TRUE,
  );

  $form['mtt_settings']['scrolltop'] = array(
    '#type' => 'fieldset',
    '#title' => t('Scroll to top'),
    '#collapsible' => TRUE,
	'#collapsed' => TRUE,
  );
  
  $form['mtt_settings']['scrolltop']['scrolltop_display'] = array(
    '#type' => 'checkbox',
    '#title' => t('Show scroll-to-top button'),
  	'#description'   => t('Use the checkbox to enable or disable scroll-to-top button.'),
	'#default_value' => theme_get_setting('scrolltop_display', 'businessclass'),
    '#collapsible' => TRUE,
	'#collapsed' => TRUE,
  );
  
  $form['mtt_settings']['color'] = array(
    '#type' => 'fieldset',
    '#title' => t('Color Schemes'),
    '#collapsible' => TRUE,
	'#collapsed' => TRUE,
  );
  
  $form['mtt_settings']['color']['color_scheme'] = array(
    '#type' => 'select',
    '#title' => t('Schemes'),
  	'#description'   => t('From the drop-down menu, select the color scheme you prefer.'),
	'#default_value' => theme_get_setting('color_scheme', 'businessclass'),
    '#options' => array(
		'default' => t('Blue / Default'),
		'gray' => t('Gray'),
		'red' => t('Red'),
		'green' => t('Green'),
    ),
  );
  
  $form['mtt_settings']['styles'] = array(
    '#type' => 'fieldset',
    '#title' => t('Style settings'),
    '#collapsible' => TRUE,
	'#collapsed' => FALSE,
  );
  
  $form['mtt_settings']['styles']['font'] = array(
    '#type' => 'fieldset',
    '#title' => t('Font settings'),
    '#collapsible' => TRUE,
	'#collapsed' => TRUE,
  );
  
  $form['mtt_settings']['styles']['font']['sitename_font_family'] = array(
    '#type' => 'select',
    '#title' => t('Site name font-family'),
	'#default_value' => theme_get_setting('sitename_font_family', 'businessclass'),
    '#options' => array(
		'sff-default' => t('Play, Helvetica, Arial, Sans-serif'),
		'sff-1' => t('Rokkitt, Helvetica, Arial, Sans-serif'),
		'sff-2' => t('PT Sans, Helvetica, Arial, Sans-serif'),
    ),
  );
  
  $form['mtt_settings']['styles']['font']['headings_font_family'] = array(
    '#type' => 'select',
    '#title' => t('Headings font-family'),
	'#default_value' => theme_get_setting('headings_font_family', 'businessclass'),
    '#options' => array(
		'hff-default' => t('Open Sans, Helvetica Neue, Helvetica, Arial, Free Sans, Sans-serif'),
		'hff-1' => t('PT Sans, Myriad Pro, Helvetica, Arial, Free Sans, Sans-serif'),
		'hff-2' => t('Podkova, Georgia, Serif'),
    ),
  );
  
 $form['mtt_settings']['styles']['font']['paragraph_font_family'] = array(
    '#type' => 'select',
    '#title' => t('Paragraph font-family'),
	'#default_value' => theme_get_setting('paragraph_font_family', 'businessclass'),
    '#options' => array(
		'pff-default' => t('Open Sans, Helvetica Neue, Helvetica, Arial, Free Sans, Sans-serif'),
		'pff-1' => t('PT Sans, Myriad Pro, Helvetica, Arial, Free Sans, Sans-serif'),
		'pff-2' => t('Lato, Myriad Pro, Helvetica, Arial, Free Sans, Sans-serif'),
		'pff-3' => t('Georgia, Times, Times New Roman, Serif'),
		'pff-4' => t('Quattrocento Sans, Times, Times New Roman, Serif'),
		'pff-5' => t('Quattrocento, Times, Times New Roman, Serif'),
    ),
  );
  
  $form['mtt_settings']['slideshow'] = array(
    '#type' => 'fieldset',
    '#title' => t('Slideshow'),
    '#collapsible' => TRUE,
	'#collapsed' => TRUE,
  );
  
  $form['mtt_settings']['slideshow']['slideshow_effect'] = array(
    '#type' => 'select',
    '#title' => t('Effects'),
  	'#description'   => t('From the drop-down menu, select the slideshow effect you prefer.'),
	'#default_value' => theme_get_setting('slideshow_effect', 'businessclass'),
    '#options' => array(
		'blindX' => t('blindX'),
		'blindY' => t('blindY'),
		'blindZ' => t('blindZ'),
		'cover' => t('cover'),
		'curtainX' => t('curtainX'),
		'curtainY' => t('curtainY'),
		'fade' => t('fade'),
		'fadeZoom' => t('fadeZoom'),
		'growX' => t('growX'),
		'growY' => t('growY'),
		'scrollUp' => t('scrollUp'),
		'scrollDown' => t('scrollDown'),
		'scrollLeft' => t('scrollLeft'),
		'scrollRight' => t('scrollRight'),
		'scrollHorz' => t('scrollHorz'),
		'scrollVert' => t('scrollVert'),
		'shuffle' => t('shuffle'),
		'slideX' => t('slideX'),
		'slideY' => t('slideY'),
		'toss' => t('toss'),
		'turnUp' => t('turnUp'),
		'turnDown' => t('turnDown'),
		'turnLeft' => t('turnLeft'),
		'turnRight' => t('turnRight'),
		'uncover' => t('uncover'),
		'wipe' => t('wipe'),
		'zoom' => t('zoom'),
    ),
  );
  
  $form['mtt_settings']['slideshow']['slideshow_effect_time'] = array(
    '#type' => 'textfield',
    '#title' => t('Effect duration (sec)'),
	'#default_value' => theme_get_setting('slideshow_effect_time', 'businessclass'),
  );
  
  $form['mtt_settings']['frontpage_content'] = array(
    '#type' => 'fieldset',
    '#title' => t('Front Page Behavior'),
    '#collapsible' => TRUE,
	'#collapsed' => TRUE,
  );
  
  $form['mtt_settings']['frontpage_content']['frontpage_emulate'] = array(
    '#type' => 'checkbox',
    '#title' => t('Emulate Drupal frontpage'),
  	'#description'   => t('Use the checkbox to emulate Drupal default frontpage. The sidebar will be automatically enabled if at least one block is placed into it. An extra region, next to the sidebar will also become available. .'),
	'#default_value' => theme_get_setting('frontpage_emulate', 'businessclass'),
    '#collapsible' => TRUE,
	'#collapsed' => TRUE,
  );
  
 $form['mtt_settings']['frontpage_content']['frontpage_content_print'] = array(
    '#type' => 'checkbox',
    '#title' => t('Enable Drupal content region'),
  	'#description'   => t('Use the checkbox to enable or disable the Drupal default content region for the front page. Enable this to have all the promoted content displayed in the frontpage. '),
	'#default_value' => theme_get_setting('frontpage_content_print', 'businessclass'),
    '#collapsible' => TRUE,
	'#collapsed' => TRUE,
  );
  
}
