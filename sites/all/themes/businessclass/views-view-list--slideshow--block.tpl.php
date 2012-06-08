<!-- #slideshow-wrapper -->
<div id="slideshow-wrapper">
    <div id="slider">
    <!-- #slideshow -->
    <div id="slideshow">
		<?php foreach ($rows as $id => $row) { ?>
        <div class="slider-item">
		
			<!-- Overriding $row result -->
			<?php $view = views_get_current_view();
            $nid = $view->result[$id]->nid; 
            $node = node_load($nid);

			if ($node->type=='mt_slideshow_entry') {
			
			//$lang = $node->language;
			$lang = 'und';
			
			//Slideshow image
			if ($node->field_teaser_image) { 
			
			$image = image_style_url('slideshow', $node->field_teaser_image[$lang][0]['uri']); 
			$title = $node->field_teaser_image[$lang][0]['title'];
			$alt = $node->field_teaser_image[$lang][0]['alt']; ?>
			
				<?php if ($node->field_slideshow_entry_path) { 
                $path = $node->field_slideshow_entry_path[$lang][0]['value']; ?>
                <a href="<?php print url($path); ?>"><img  src="<?php print $image; ?>" title="<?php print $title; ?>" alt="<?php print $alt; ?>"/></a>
                <?php } else { ?> 
                <img title="<?php print $title; ?>" alt="<?php print $alt; ?>" src="<?php print $image; ?>"/>
                <?php } ?>
			
			<?php } ?> 
			
			<?php //Slideshow text
			if ($node->field_teaser): ?>
			<div class="slider-text">
			<?php print $node->field_teaser[$lang][0]['value']; ?>
			</div>
			<?php endif; ?>
			
			<?php } else { print $row; } ?> 
            <!-- EOF: Overriding $row result -->   
        
        </div>
        <?php } ?>
    </div><!-- EOF: #slideshow -->
    </div><!-- EOF: #slider -->
</div><!-- EOF: #slideshow-wrapper -->

<!-- #slider-controls-wrapper -->
<div id="slider-controls-wrapper">

    <!-- #slider-controls -->
    <div id="slider-controls">
        <ul id="slider-navigation">
			<?php foreach ($rows as $id => $row){ ?>
            <li><a href="#"></a></li>
            <?php } ?>
        </ul>
    </div><!-- EOF: #slider-controls -->

</div><!-- EOF: #slider-controls-wrapper -->