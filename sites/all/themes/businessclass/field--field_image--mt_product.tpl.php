<?php if (!$label_hidden) : ?>
<div class="field-label"<?php print $title_attributes; ?>><?php print $label ?>:&nbsp;</div>
<?php endif; ?>

<?php
// Reduce number of images in teaser view mode to single image
if ($element['#view_mode'] == 'teaser') : ?>
<div class="field-item field-type-image even"<?php print $item_attributes[0]; ?>><?php print render($items[0]); ?></div> 
<?php return; endif; ?>

<?php $node=$element['#object']; $lang ='und'; //$lang = $node->language; ?>

<!-- #content-slider -->
<div id="content-slider">
	<!-- #content-slideshow -->
	<div id="content-slideshow">
    
		<?php $numberOfImages=0; foreach ($node->field_image[$lang] as $key=>$file) { 
		$numberOfImages++; 
		if(ini_get('allow_url_fopen') == 1) { 
		list($width, $height, $type, $attr)= getimagesize(image_style_url('x-large', $node->field_image[$lang][$key]['uri'])); 
		} else { 
		$height='300';
		}
		?>
		<div class="content-slider-item">
			<img height="<?php print $height; ?>" src="<?php print image_style_url('x-large', $node->field_image[$lang][$key]['uri']); ?>" alt="<?php print $node->field_image[$lang][$key]['alt']; ?>" title="<?php print $node->field_image[$lang][$key]['title']; ?>"/>
			<div class="content-caption"><?php print $node->field_image[$lang][$key]['alt']; ?></div>
		</div> 
		<?php } ?>  
	</div><!-- EOF:#content-slideshow -->
    
	<?php if ($numberOfImages>1): ?>
	<div id="content-slider-controls-title"><?php print t('OTHER PRODUCT PHOTOS'); ?></div>
	
	<!-- #content-slider-controls -->
	<div id="content-slider-controls">
		<ul id="content-slider-navigation">
			<?php foreach ($node->field_image[$lang] as $key=>$file) { ?>
			<li><a href="#"><img src="<?php print image_style_url('small', $node->field_image[$lang][$key]['uri']); ?>" alt="<?php print $node->field_image[$lang][$key]['alt']; ?>" title="<?php print $node->field_image[$lang][$key]['title']; ?>"/></a></li> 
		   <?php } ?>
		</ul>
	</div><!-- EOF: #content-slider-controls -->
    <?php endif; ?>
    
</div><!-- EOF:#content-slider -->