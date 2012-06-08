<?php if (!$label_hidden) : ?>
<div class="field-label"<?php print $title_attributes; ?>><?php print $label ?>:&nbsp;</div>
<?php endif; ?>

<?php
// Reduce number of images in teaser view mode to single image
if ($element['#view_mode'] == 'teaser') : ?>
<div class="field-item field-type-image even"<?php print $item_attributes[0]; ?>><?php print render($items[0]); ?></div> 
<?php return; endif; ?>

<?php $node=$element['#object']; $lang ='und'; //$lang = $node->language; ?>

<div class="field-type-image">
<img src="<?php print image_style_url('large', $node->field_image[$lang][0]['uri']); ?>" alt="<?php print $node->field_image[$lang][0]['alt']; ?>" title="<?php print $node->field_image[$lang][0]['title']; ?>"/>
</div>

<?php $numberOfImages=0; foreach ($node->field_image[$lang] as $key=>$file) { $numberOfImages++; } ?>  

<?php if ($numberOfImages>1) { ?>   
<div class="yoxview">
<div id="yoxview-title"><?php print t('OTHER SERVICE PHOTOS'); ?></div>

	<?php foreach ($node->field_image[$lang] as $key=>$file) { ?>
	<div class="yoxview-item">
	<a href="<?php print file_create_url($node->field_image[$lang][$key]['uri']) ?>">
	<img src="<?php print image_style_url('small', $node->field_image[$lang][$key]['uri']); ?>" alt="<?php print $node->field_image[$lang][$key]['alt']; ?>" title="<?php print $node->field_image[$lang][$key]['title']; ?>"/>
	</a>
	</div> 
	<?php } ?> 
     
</div>
<?php }  ?>

<script type="text/javascript" src="<?php print base_path() . 'misc/jquery.js'?>"></script>

<script type="text/javascript" src="<?php print base_path() . drupal_get_path('theme', 'businessclass') . '/js/yoxview/yoxview-init.js'?>"></script>

<?php
drupal_add_js('jQuery(document).ready(function($) { 
jQuery(".yoxview").yoxview({lang: "en", skin: "top_menu" });
});',
array('type' => 'inline', 'scope' => 'footer')); 
?>