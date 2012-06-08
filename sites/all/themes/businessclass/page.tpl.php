<?php if (theme_get_setting('scrolltop_display')): ?>
<div id="toTop"><?php print t('Back to Top'); ?></div>
<?php endif; ?>

<!-- #header -->
<div id="header">

    <!-- #header-inside -->
    <div id="header-inside" class="clearfix">
    
        <!-- #header-left -->
        <?php if ($page['header']) : ?>
        <div id="header-left">
        <?php print render($page['header']); ?>
        </div>
        <?php endif; ?>
        <!-- EOF: #header-left -->
        
        
        <!-- #header-right -->
        <?php if ($page['header_right']) : ?>
        <div id="header-right">
       	<?php print render($page['header_right']); ?>
        </div>
        <?php endif; ?>
        <!-- EOF: #header-right -->
    
    </div><!-- EOF: #header-inside -->

</div><!-- EOF: #header -->

<!-- #page-wrapper -->
<div id="page-wrapper">

    <!-- #page -->
    <div id="page">
    
        <!-- #navigation -->
        <div id="navigation" class="clearfix">
        
            <!-- #navigation-left -->
            <div id="navigation-left">
            
				<?php if ($logo): ?>
                	<div id="logo">
                    <a href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>" rel="home">
                    <img src="<?php print $logo; ?>" alt="<?php print t('Home'); ?>" />
                    </a>
                    </div>
                <?php endif; ?>
                
				<?php if ($site_name || $site_slogan): ?>
                    <?php if ($site_name): ?>
                    <div id="site-name"><a href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>"><?php print $site_name; ?></a></div>
                    <?php endif; ?>
                    
                    <?php if ($site_slogan): ?>
                    <div id="slogan"><?php print $site_slogan; ?></div>
                    <?php endif; ?>
                <?php endif; ?>
            
            </div><!-- EOF: #navigation-left -->
            
            <!-- #navigation-right -->
            <div id="navigation-right">
            
			<?php if ($page['navigation']) : ?>
            <?php print drupal_render($page['navigation']); ?>
            <?php else : ?>
            	<div id="main-menu">
                <?php print theme('links__system_main_menu', array(
                  'links' => $main_menu,
                  'attributes' => array(
                    'class' => array('links', 'main-menu', 'menu'),
                  ),
                  'heading' => array(
                    'text' => t('Main menu'),
                    'level' => 'h2',
                    'class' => array('element-invisible'),
                  ),
                )); ?>
                </div>
            <?php endif; ?>

            </div><!-- EOF: #navigation-right -->
        
        </div><!-- EOF: #navigation -->
        
    	<!-- #banner -->
    	<?php if ($page['banner']): ?>
        <div id="banner" class="clearfix">
		<?php print render($page['banner']); ?>
        </div>
        <?php endif; ?>
        <!-- EOF: #banner -->
        
        <!-- #highlighted -->
		<?php if ($page['highlighted']): ?>
        <div id="highlighted" class="clearfix">
		<?php print render($page['highlighted']); ?>
        </div>
        <?php endif; ?>
        <!-- EOF: #highlighted -->
    
        <!-- #page-inside-wrapper -->
        <div id="page-inside-wrapper">
        
            <!-- #page-inside -->
            <div id="page-inside">
            
                 <!-- #main -->
                <div id="main">
                
				<?php if ($breadcrumb && theme_get_setting('breadcrumb_display')): ?>
                <div id="breadcrumb"><?php print $breadcrumb; ?></div>
                <?php endif; ?>
                
                <?php if ($tabs): ?>
                <div class="tabs">
                <?php print render($tabs); ?>
                </div>
                <?php endif; ?>
                
                <?php print $messages; ?>
                
				<?php print render($page['help']); ?>
                
                <a id="main-content"></a>
                <?php print render($title_prefix); ?>
                <?php if ($title): ?>
                <h1 class="title"><?php print $title; ?></h1>
                <?php endif; ?>
                <?php print render($title_suffix); ?>

                <?php if ($action_links): ?>
                <ul class="action-links">
                <?php print render($action_links); ?>
                </ul>
                <?php endif; ?>
                
                <?php print render($page['content']); ?>
                
                <?php print $feed_icons; ?>

                </div><!-- EOF: #main -->
                
                <!-- #sidebar -->
				<?php if ($page['sidebar_first']): ?>
                <div id="sidebar">
				<?php print render($page['sidebar_first']); ?>
                </div>
                <?php endif; ?>
                <!-- EOF: #sidebar -->
            
            </div><!-- EOF: #page-inside -->
            
    	</div><!-- EOF: #page-inside-wrapper -->
        
    </div><!-- EOF: #page -->

</div><!-- EOF: #page-wrapper -->

<!-- #footer -->
<div id="footer">

    <!-- #footer-inside -->
    <div id="footer-inside">
    
        <!-- #footer-first -->
        <div id="footer-first">
        <?php if ($page['footer_first']): ?>
		<?php print render($page['footer_first']); ?>
		<?php endif; ?>
        </div>
        <!-- EOF: #footer-first -->
        
        <!-- #footer-second -->
        <div id="footer-second">
        <?php if ($page['footer_second']): ?>
		<?php print render($page['footer_second']); ?>
		<?php endif; ?>
        </div><!-- EOF: #footer-second -->
        
        <!-- #footer-third -->
        <div id="footer-third">
        <?php if ($page['footer_third']): ?>
		<?php print render($page['footer_third']); ?>
		<?php endif; ?>
        </div><!-- EOF: #footer-third -->
   
    </div><!-- EOF: #footer-inside -->

</div><!-- EOF: #footer -->

<!-- #subfooter -->
<div id="subfooter">

    <!-- #subfooter-inside -->
    <div id="subfooter-inside">

        <!-- #subfooter-left -->
        <div id="subfooter-left">
		<?php print render($page['footer']); ?>
        </div><!-- EOF: #subfooter-left -->
        
        <!-- #subfooter-right -->
        <div id="subfooter-right">
		<?php print theme('links__system_secondary_menu', array('links' => $secondary_menu, 'attributes' => array('class' => array('secondary-menu', 'links', 'clearfix')))); ?>
        <?php print render($page['footer_bottom_right']); ?>
        </div><!-- EOF: #subfooter-right -->

    </div><!-- EOF: #subfooter-inside -->

</div><!-- EOF: #subfooter -->