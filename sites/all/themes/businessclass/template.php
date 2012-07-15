<?php
/**
 * Return a themed breadcrumb trail.
 *
 * @param $breadcrumb
 *   An array containing the breadcrumb links.
 * @return
 *   A string containing the breadcrumb output.
 */
function businessclass_breadcrumb($variables){
  $breadcrumb = $variables['breadcrumb'];
  if (!empty($breadcrumb)) {
    $breadcrumb[] = drupal_get_title();
    return '<div class="breadcrumb">' . implode(' <span class="breadcrumb-separator">/</span> ', $breadcrumb) . '</div>';
  }
}

/**
 * Override or insert variables into the html template.
 */
function businessclass_preprocess_html(&$variables) {
	
	$color_scheme = theme_get_setting('color_scheme');
	
	if ($color_scheme != 'default') {
	drupal_add_css(drupal_get_path('theme', 'businessclass') . '/style-' .$color_scheme. '.css', array('group' => CSS_THEME, 'type' => 'file'));
	}
	
	if (drupal_is_front_page()) {
		if (empty($variables['page']['promoted']) && !theme_get_setting('frontpage_emulate')) {
			$variables['classes_array'][] = 'no-promoted-area';
		}
	}
	
	// Adding Open Sans embedded font
	drupal_add_css(drupal_get_path('theme', 'businessclass') . '/opensans-font.css', array('group' => CSS_THEME, 'type' => 'file'));

	// Adding Play embedded font
	if (theme_get_setting('sitename_font_family')=='sff-default') {
	drupal_add_css(drupal_get_path('theme', 'businessclass') . '/play-font.css', array('group' => CSS_THEME, 'type' => 'file'));
	}
	
	// Adding Rokkitt embedded font
	if (theme_get_setting('sitename_font_family')=='sff-1') {
	drupal_add_css(drupal_get_path('theme', 'businessclass') . '/rokkitt-font.css', array('group' => CSS_THEME, 'type' => 'file'));
	}
	
	// Adding PT_Sans embedded font
	if (theme_get_setting('sitename_font_family')=='sff-2' || theme_get_setting('headings_font_family')=='hff-1' || theme_get_setting('paragraph_font_family')=='pff-1') {
	drupal_add_css(drupal_get_path('theme', 'businessclass') . '/ptsans-font.css', array('group' => CSS_THEME, 'type' => 'file'));
	}
	
	// Adding Podkova embedded font
	if (theme_get_setting('headings_font_family')=='hff-2') {
	drupal_add_css(drupal_get_path('theme', 'businessclass') . '/podkova-font.css', array('group' => CSS_THEME, 'type' => 'file'));
	}
	
	// Adding Lato embedded font
	if (theme_get_setting('paragraph_font_family')=='pff-2') {
	drupal_add_css(drupal_get_path('theme', 'businessclass') . '/lato-font.css', array('group' => CSS_THEME, 'type' => 'file'));
	}
	
	// Adding Quattrocento Sans embedded font
	if (theme_get_setting('paragraph_font_family')=='pff-4') {
	drupal_add_css(drupal_get_path('theme', 'businessclass') . '/quattrocentosans-font.css', array('group' => CSS_THEME, 'type' => 'file'));
	}
	
	// Adding Quattrocento embedded font
	if (theme_get_setting('paragraph_font_family')=='pff-5') {
	drupal_add_css(drupal_get_path('theme', 'businessclass') . '/quattrocento-font.css', array('group' => CSS_THEME, 'type' => 'file'));
	}
	
}

/**
 * Override or insert variables into the html template.
 */
function businessclass_process_html(&$vars) {

  $classes = explode(' ', $vars['classes']);
  $classes[] = theme_get_setting('sitename_font_family');
  $classes[] = theme_get_setting('headings_font_family');
  $classes[] = theme_get_setting('paragraph_font_family');
  $vars['classes'] = trim(implode(' ', $classes));
 
}

function businessclass_form_alter(&$form, &$form_state, $form_id) {
  if ($form_id == 'search_block_form') {
  
    unset($form['search_block_form']['#title']);
	
    $form['search_block_form']['#title_display'] = 'invisible';
	$form_default = t('Search site');
    $form['search_block_form']['#default_value'] = $form_default;
    $form['actions']['submit'] = array('#type' => 'image_button', '#src' => base_path() . path_to_theme() . '/images/search-button.png');

 	$form['search_block_form']['#attributes'] = array('onblur' => "if (this.value == '') {this.value = '{$form_default}';}", 'onfocus' => "if (this.value == '{$form_default}') {this.value = '';}" );
  }
}

/**
 * Add javascript for front-page slideshow
 */
$effect=theme_get_setting('slideshow_effect');
$effect_time=theme_get_setting('slideshow_effect_time')*1000;
drupal_add_js('jQuery(document).ready(function($) { 

$("#slideshow").cycle({
	fx:     "'.$effect.'",
	speed:  "slow",
	timeout: "'.$effect_time.'",
	pager:  "#slider-navigation",
	pagerAnchorBuilder: function(idx, slide) {
		// return sel string for existing anchor
		return "#slider-navigation li:eq(" + (idx) + ") a";
	} 
});

});',
array('type' => 'inline', 'scope' => 'header'));
//EOF:Javascript

/**
 * Add javascript for content slideshow (Product content type)
 */
drupal_add_js('jQuery(document).ready(function($) {  

$("#content-slideshow").cycle({
	fx:     "none",
	speed:  "slow",
	timeout: 0,
	pager:  "#content-slider-navigation",
	pagerEvent: "mouseover", 
	pauseOnPagerHover: true,
	pagerAnchorBuilder: function(idx, slide) {
		// return sel string for existing anchor
		return "#content-slider-navigation li:eq(" + (idx) + ") a";
	}
});

$.fn.cycle.updateActivePagerLink = function(pager, currSlideIndex) { 
$(pager).find("li").removeClass("activeLI") 
	.filter("li:eq("+currSlideIndex+")").addClass("activeLI"); 
}; 

});',
array('type' => 'inline', 'scope' => 'header'));
//EOF:Javascript

/**
 * Add javascript for equal columns height
 */
if (!drupal_is_front_page()) {
drupal_add_js('
jQuery(document).ready(function($) {

var maxHeight = $("div#page-inside").height();
var paddingSidebarTB = parseInt($("div#sidebar").css("padding-top")) + parseInt($("div#sidebar").css("padding-bottom"));

document.getElementById("sidebar").style.minHeight = (maxHeight - paddingSidebarTB)+"px";

});
',array('type' => 'inline', 'scope' => 'footer'));
}
//EOF:Javascript

/**
 * Add javascript for equal columns height
 */
if (theme_get_setting('frontpage_emulate')) {
drupal_add_js('
jQuery(document).ready(function($) {

var maxHeight = $("div#promoted-inside").height()-$("div.region-promoted").height()-80;
//$("div#sidebar").height(maxHeight);
document.getElementById("sidebar").style.minHeight = maxHeight+"px";

});
',array('type' => 'inline', 'scope' => 'footer'));
}
//EOF:Javascript

/**
 * Add javascript for enable/disable scroll to top action button
 */
if (theme_get_setting('scrolltop_display')) {
drupal_add_js('jQuery(document).ready(function($) { 
$(window).scroll(function() {
	if($(this).scrollTop() != 0) {
		$("#toTop").fadeIn();	
	} else {
		$("#toTop").fadeOut();
	}
});

$("#toTop").click(function() {
	$("body,html").animate({scrollTop:0},800);
});	

});',
array('type' => 'inline', 'scope' => 'header'));
}
//EOF:Javascript

?>
