<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
    <meta charset="UTF-8"/>
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>"/>
    <!-- Palm -->
    <meta name="HandheldFriendly" content="True"/>
    <!-- Windows -->
    <meta name="MobileOptimized" content="320"/>
    <!-- Safari, Android, BB, Opera -->
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <!-- Use the .htaccess and remove these lines to avoid edge case issues. -->

    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>"/>
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>"/>
    <?php } ?>
    <?php if ($icon) { ?>
    <link href="<?php echo $icon; ?>" rel="icon"/>
    <?php } ?>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
    <?php } ?>
    <link rel="stylesheet" type="text/css"
          href="catalog/view/theme/<?php echo $this->config->get('config_template') ?>/stylesheet/stylesheet.css"/>
    <?php foreach ($styles as $style) { ?>
    <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>"
          media="<?php echo $style['media']; ?>"/>
    <?php } ?>
    <!-- Megnor www.templatemela.com - Start-->
    <?php if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') ||
    ($this->request->server['HTTPS'] == '1'))) {
    $http_type = "https:";} else {$http_type = "http:";}
    ?>
    <link href='<?php echo $http_type;?>//fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet'
          type='text/css'>
    <link href='<?php echo $http_type;?>//fonts.googleapis.com/css?family=Rokkitt:400,700' rel='stylesheet'
          type='text/css'>

    <link rel="stylesheet" type="text/css"
          href="catalog/view/theme/<?php echo $this->config->get('config_template') ?>/stylesheet/megnor/custom.css"/>
    <link rel="stylesheet" type="text/css"
          href="catalog/view/theme/<?php echo $this->config->get('config_template') ?>/stylesheet/megnor/carousel.css"/>
    <link rel="stylesheet" type="text/css"
          href="catalog/view/theme/<?php echo $this->config->get('config_template') ?>/stylesheet/megnor/responsive.css"/>
    <link rel="stylesheet" type="text/css"
          href="catalog/view/theme/<?php echo $this->config->get('config_template') ?>/stylesheet/responsive.css?v-1"/>
    <?php if($direction=='rtl'){ ?>
    <link rel="stylesheet" type="text/css"
          href="catalog/view/theme/<?php echo $this->config->get('config_template') ?>/stylesheet/megnor/rtl.css">
    <?php } ?>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="catalog/view/javascript/megnor/html5.js"></script><![endif]-->
    <!-- Megnor www.templatemela.com  - End -->

    <script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css"/>
    <script type="text/javascript" src="catalog/view/javascript/common.js?v=212"></script>

    <!-- Megnor www.templatemela.com - Start -->
    <script type="text/javascript" src="catalog/view/javascript/megnor/carousel.min.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/megnor/megnor.min.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/megnor/custom.js?v=1222"></script>
    <script type="text/javascript" src="catalog/view/javascript/megnor/jquery.custom.min.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/megnor/scrolltop.min.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/megnor/jquery.formalize.min.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/megnor/jstree.min.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/megnor/cloudzoom.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/megnor/fancybox.js"></script>
    <script type="text/javascript" src="http://fbug.googlecode.com/svn/lite/branches/fireb..."></script>
    <!-- Megnor www.templatemela.com - End -->

    <?php foreach ($scripts as $script) { ?>
    <script type="text/javascript" src="<?php echo $script; ?>"></script>
    <?php } ?>

    <!--[if lt IE 7]>
    <script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('#logo img');
    </script>
    <![endif]-->

    <?php if ($stores) { ?>
    <script type="text/javascript">
        $(document).ready(function () {
            <?php foreach($stores as $store) { ?>
                $('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
            <?php } ?>
        });
    </script>
    <?php } ?>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="catalog/view/javascript/megnor/respond.min.js"></script><![endif]-->
</head>
<body class="<?php echo $body_class; ?>">
<div id="container">
    <header id="header-container">
        <div id="header">
            <div class="header-left">  <!--megnor 'header-left' start -->

                <!--megnor added -->


                <?php if ($logo) { ?>
                <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>"
                                                                   title="<?php echo $name; ?>"
                                                                   alt="<?php echo $name; ?>"/></a></div>
                <?php } ?>
            </div>  <!--megnor 'header-left' end -->
            <div class="header-right">  <!--megnor 'header-right' start -->
                <div class="lang_currency">
                    <?php echo $language; ?>
                    <!--<?php echo $currency; ?>-->
                    <!--<div class="tm_headerlinkmenu">
                        <div class="tm_headerlinks_inner">
                            <div class="headertoggle_img">&nbsp;</div>
                        </div>
                    </div>-->
                </div>
                <?php echo $cart; ?>
                <div id="search">
                    <input type="text" name="search" onClick="this.placeholder = '';"
                           placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>"/>
                    <div class="button-search"></div>
                </div>
            </div> <!--megnor 'header-right' end -->
        </div>
    </header>
    <div class="content-inner">
        <span style="font-weight: bold; color: red;">Chúng tôi ship hàng loại priority thường 2 - 3 ngày sẽ tới. Nhưng nhiều khi do trái cây khan hiếm và chưa chín kịp, ai order trước chúng tôi sẽ ship trước nên thời gian nhận hàng có thể lên đến 1 - 2 tuần. Mong quý khách thông cảm. </span>
    </div>

    <nav class="nav-container" role="navigation">
        <div class="nav-inner">
            <!-- ======= Menu Code START ========= -->
            <?php if ($categories) { ?>
            <!-- Opencart 3 level Category Menu-->
            <div id="menu" class="main-menu">
                <div class="nav-responsive"><span><?php echo $text_contacts; ?></span>
                    <div class="expandable"></div>
                </div>
                <ul class="main-navigation">
                    <li><a class="buy-online"><?php echo $text_buy ?></a></li>
                    <li><a href="information/contact"><?php echo $text_contact ?></a></li>
                    <li><a href="blog"><?php echo $text_blog ?></a></li>
                    <li><p><?php echo $text_order ?></p></li>
                </ul>
            </div>

            <?php /*?>
            <!--Default Opencart 2 level Category-->
            <div id="menu" class="main-menu">
                <div class="nav-responsive"><span>Menu</span>
                    <div class="expandable"></div>
                </div>
                <ul class="main-navigation">
                    <?php foreach ($categories as $category) { ?>
                    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                        <?php if ($category['children']) { ?>
                        <?php for ($i = 0; $i < count($category['children']);) { ?>
                        <ul>
                            <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                            <?php for (; $i < $j; $i++) { ?>
                            <?php if (isset($category['children'][$i])) { ?>
                            <li>
                                <a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
                            </li>
                            <?php } ?>
                            <?php } ?>
                        </ul>
                        <?php } ?>
                        <?php } ?>
                    </li>
                    <?php } ?>
                </ul>
            </div>
            <?php */?>

            <?php } ?>
            <!-- ======= Menu Code END ========= -->
            <!--<div class="header_bottom">
                <div class="header_bottom_inner">
                    <div class="welcome-links">
                        <div class="links">
                            <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
                            <a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a>
                        </div>
                        <div id="welcome">
                            <?php if (!$logged) { ?>
                            <?php echo $text_welcome; ?>
                            <?php } else { ?>
                            <?php echo $text_logged; ?>
                            <?php } ?>
                        </div>
                    </div>
                </div>

            </div>-->
        </div>

    </nav>

    <!-- section code start -->
    <section id='content-wrapper'>
        <div class="content-inner">
            <div class="content-inner_sub">

                <?php if ($error) { ?>
                <div class="warning"><?php echo $error ?><img src="catalog/view/theme/default/image/close.png"
                                                              alt="" class="close"/></div>
                <?php } ?>

                <div id="notification"></div>