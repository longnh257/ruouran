<div class="box">
    <div class="box-heading"><?php echo $heading_title; ?></div>
    <div class="box-content">
        <!-- Megnor Start-->
        <?php
		$sliderFor = 10;
		$productCount = sizeof($products);
	?>
        <?php if ($productCount >= $sliderFor): ?>
        <div class="customNavigation">
            <a class="btn prev">&nbsp;</a>
            <a class="btn next">&nbsp;</a>
        </div>
        <?php endif; ?>
        <!-- In Stock -->
        <div class="box-product <?php if ($productCount >= $sliderFor){?>product-carousel<?php }else{?>productbox-grid<?php }?>"
             id="<?php if ($productCount >= $sliderFor){?>all-carousel<?php }else{?>all-grid<?php }?>">
            <!-- Megnor End-->
            <?php foreach ($products as $product) { ?>
                <?php if($product['quantity']){ ?>
                <div class="<?php if ($productCount >= $sliderFor){?>slider-item<?php }else{?>product-items<?php }?>">
                    <div class="product-block">
                        <div class="product-block-inner">
                            <?php if ($product['thumb']) { ?>
                            <div class="image"><a href="<?php echo $product['href']; ?>"><img
                                            src="<?php echo $product['thumb']; ?>"
                                            alt="<?php echo $product['name']; ?>"/></a></div>
                            <?php } ?>
                            <?php if (!$product['special']) { ?>
                            <?php } else { ?>
                            <span class="saleicon sale">Sale</span>
                            <?php } ?>

                            <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                            </div>
                            <?php if ($product['price']) { ?>
                            <div class="price">
                                <?php if (!$product['special']) { ?>
                                <?php echo $product['price']; ?>
                                <?php } else { ?>
                                <span class="price-old"><?php echo $product['price']; ?></span> <span
                                        class="price-new"><?php echo $product['special']; ?></span>
                                <?php } ?>
                            </div>
                            <?php } ?>
                            <?php if ($product['rating']) { ?>
                            <div class="rating"><img
                                        src="catalog/view/theme/<?php echo $this->config->get('config_template') ?>/image/stars-<?php echo $product['rating']; ?>.png"
                                        alt="<?php echo $product['reviews']; ?>"/></div>
                            <?php } ?>
                            <!--<div class="cart"><a value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />Add to Cart</a></div>-->

                            <div><a href="<?php echo $product['href']; ?>" type="button" id="button-cart"
                                    class="button"><?php echo $button_detail; ?></a></div>
                        </div>
                    </div>
                </div>
                <?php } ?>
            <?php } ?>
        </div>
        <!-- End In Stock -->
        <div class="content-inner" style="width: 100%; text-align: center;">
            <span style="font-weight: bold; color: red;">Những loại trái cây sau đây hiện tại đang hết mùa, sẽ có lại trong vài tháng tới. </span>
        </div>
        <!-- Out Of Stock -->
        <div class="box-product <?php if ($productCount >= $sliderFor){?>product-carousel<?php }else{?>productbox-grid<?php }?>"
             id="<?php if ($productCount >= $sliderFor){?>all-carousel<?php }else{?>all-grid<?php }?>">
            <!-- Megnor End-->
            <?php foreach ($products as $product) { ?>
                <?php if(!$product['quantity']){ ?>
            <div class="<?php if ($productCount >= $sliderFor){?>slider-item<?php }else{?>product-items<?php }?>">
                <div class="product-block">
                    <div class="product-block-inner">
                        <?php if ($product['thumb']) { ?>
                        <div class="image"><a href="javascript:void(0);"><img
                                        src="<?php echo $product['thumb']; ?>"
                                        alt="<?php echo $product['name']; ?>"/></a></div>
                        <?php } ?>
                        <?php if (!$product['special']) { ?>
                        <?php } else { ?>
                        <span class="saleicon sale">Sale</span>
                        <?php } ?>

                        <div class="name"><a href="javascript:void(0);"><?php echo $product['name']; ?></a>
                        </div>
                        <!--
                        <?php if ($product['price']) { ?>
                        <div class="price">
                            <?php if (!$product['special']) { ?>
                            <?php echo $product['price']; ?>
                            <?php } else { ?>
                            <span class="price-old"><?php echo $product['price']; ?></span> <span
                                    class="price-new"><?php echo $product['special']; ?></span>
                            <?php } ?>
                        </div>
                        <?php } ?>
                        -->
                        <?php if ($product['rating']) { ?>
                        <div class="rating"><img
                                    src="catalog/view/theme/<?php echo $this->config->get('config_template') ?>/image/stars-<?php echo $product['rating']; ?>.png"
                                    alt="<?php echo $product['reviews']; ?>"/></div>
                        <?php } ?>
                        <!--<div class="cart"><a value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />Add to Cart</a></div>-->

                        <!--<div><a href="<?php echo $product['href']; ?>" type="button" id="button-cart"
                                class="button"><?php echo $button_detail; ?></a></div>-->
                    </div>
                </div>
            </div>
                <?php } ?>
            <?php } ?>
        </div>
        <!-- End Out Of Stock -->
    </div>
</div>
<span class="all_default_width" style="display:none; visibility:hidden"></span>