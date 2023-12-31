<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a
                href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <h1><?php echo $heading_title; ?></h1>
    <?php if ($thumb || $description) { ?>
    <div class="category-info">
        <?php if ($thumb) { ?>
        <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>"/></div>
        <?php } ?>
        <?php if ($description) { ?>
        <?php echo $description; ?>
        <?php } ?>
    </div>
    <?php } ?>
    <?php if ($categories) { ?>
    <h2><?php echo $text_refine; ?></h2>
    <div class="category-list">
        <?php if (count($categories) <= 5) { ?>
        <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
        </ul>
        <?php } else { ?>
        <?php for ($i = 0; $i < count($categories);) { ?>
        <ul>
            <?php $j = $i + ceil(count($categories) / 4); ?>
            <?php for (; $i < $j; $i++) { ?>
            <?php if (isset($categories[$i])) { ?>
            <li><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></li>
            <?php } ?>
            <?php } ?>
        </ul>
        <?php } ?>
        <?php } ?>
    </div>
    <?php } ?>
    <?php if ($products) { ?>
    <div class="product-filter">
        <div class="display"><span class="<?php echo $text_list; ?>"><?php echo $text_list; ?></span><span
                    class="<?php echo $text_grid; ?>"><a onclick="display('grid');"><?php echo $text_grid; ?></a></span>
        </div>
        <div class="limit"><?php echo $text_limit; ?>
            <select onchange="location = this.value;">
                <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                <option value="<?php echo $limits['href']; ?>"
                        selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
                <?php } ?>
            </select>
        </div>
        <div class="sort"><span><?php echo $text_sort; ?></span>
            <select onchange="location = this.value;">
                <?php foreach ($sorts as $sorts) { ?>
                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                <?php } ?>
                <?php } ?>
            </select>
        </div>
        <div class="product-compare"><a href="<?php echo $compare; ?>"
                                        id="compare-total"><?php echo $text_compare; ?></a></div>
    </div>

    <div class="product-grid-list">
        <ul class="product-list" id="product-list-grid">
            <?php foreach ($products as $product) { ?>
            <li>
                <div class="product-block">
                    <div class="product-block-inner">
                        <?php if ($product['thumb']) { ?>
                        <div class="image"><a href="<?php echo $product['href']; ?>"><img
                                        src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>"
                                        alt="<?php echo $product['name']; ?>"/></a></div>
                        <?php } ?>
                        <div class="saleblock">
                            <?php if (!$product['special']) { ?>
                            <?php } else { ?>
                            <span class="saleicon sale">Sale</span>
                            <?php } ?>
                        </div>

                        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                        </div>
                        <div class="description"><?php echo $product['description']; ?></div>
                        <?php if ($product['price']) { ?>
                        <div class="price">
                            <?php if (!$product['special']) { ?>
                            <?php echo $product['price']; ?>
                            <?php } else { ?>
                            <span class="price-old"><?php echo $product['price']; ?></span> <span
                                    class="price-new"><?php echo $product['special']; ?></span>
                            <?php } ?>
                            <?php if ($product['tax']) { ?>
                            <br/>
                            <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                            <?php } ?>
                        </div>
                        <?php } ?>
                        <?php if ($product['rating']) { ?>
                        <div class="rating"><img
                                    src="catalog/view/theme/<?php echo $this->config->get('config_template') ?>/image/stars-<?php echo $product['rating']; ?>.png"
                                    alt="<?php echo $product['reviews']; ?>"/></div>
                        <?php } ?>
                        <div class="cart">
                            <input type="button" value="<?php echo $button_cart; ?>"
                                   onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"/>
                        </div>
                        <div class="wishlist"><a
                                    onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a>
                        </div>
                        <div class="compare"><a
                                    onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a>
                        </div>
                    </div>
                </div>
            </li>
            <?php } ?>
        </ul>
    </div>
    <div class="pagination"><?php echo $pagination; ?></div>
    <?php } ?>
    <?php if (!$categories && !$products) { ?>
    <div class="content"><?php echo $text_empty; ?></div>
    <div class="buttons">
        <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>
    <?php } ?>
    <?php echo $content_bottom; ?></div>
<script type="text/javascript" src="catalog/view/javascript/megnor/listgrid.js"></script>
<?php echo $footer; ?>