<?php

/**
 * @file
 * Override of the default maintenance page.
 *
 * This is an override of the default maintenance page. Used for Garland and
 * Minnelli, this file should not be moved or modified since the installation
 * and update pages depend on this file.
 *
 * This mirrors closely page.tpl.php for Garland in order to share the same
 * styles.
 */
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php print $language->language ?>" lang="<?php print $language->language ?>" dir="<?php print $language->dir ?>">
    <head>
    <title><?php print $head_title ?></title>
    <?php print $head ?>
    <link rel="stylesheet" type="text/css" href="<?php print drupal_get_path('theme', 'businessclass') . '/opensans-font.css' ?>" />
    <link rel="stylesheet" type="text/css" href="<?php print drupal_get_path('theme', 'businessclass') . '/play-font.css' ?>" />
    <?php print $styles ?>
    <?php print $scripts ?>
    </head>
    
    <body class="<?php print $classes; ?>" <?php print $attributes;?>>
  
        <!-- #header -->
        <div id="header">
        
            <!-- #header-inside -->
            <div id="header-inside" class="clearfix">

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
        
                    </div><!-- EOF: #navigation-right -->
                
                </div><!-- EOF: #navigation -->
            
                <!-- #page-inside-wrapper -->
                <div id="page-inside-wrapper">
                
                    <!-- #page-inside -->
                    <div id="page-inside">
                    
                         <!-- #main -->
                        <div id="main">
                        
						<?php print $messages; ?>
                        
                        <?php if ($title): ?><h1 class="title"><?php print $title; ?></h1> <?php endif; ?>
        
                        <?php print $content; ?>
        
                        </div><!-- EOF: #main -->
                        
                        <!-- #sidebar -->

                        <div id="sidebar">

                        </div>

                        <!-- EOF: #sidebar -->
                    
                    </div><!-- EOF: #page-inside -->
                    
                </div><!-- EOF: #page-inside-wrapper -->
                
            </div><!-- EOF: #page -->
        
        </div><!-- EOF: #page-wrapper -->
        
        <!-- #footer -->
        <div id="footer">
        
            <!-- #footer-inside -->
            <div id="footer-inside">
            
           
            </div><!-- EOF: #footer-inside -->
        
        </div><!-- EOF: #footer -->
        
        <!-- #subfooter -->
        <div id="subfooter">
        
            <!-- #subfooter-inside -->
            <div id="subfooter-inside">
        
            </div><!-- EOF: #subfooter-inside -->
        
        </div><!-- EOF: #subfooter -->
  </body>
</html>