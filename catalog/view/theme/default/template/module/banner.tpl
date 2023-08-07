<?php $i = 0;
if($banners[$i]['title']=='b1'){
?>
<div class="product-items">
<div class="product-block">



<div class="box">
  <!--<div class="box-heading"><?php echo $special_product; ?></div>-->
  <div class="box-heading"><?php echo $coming_soon; ?></div>
    <div id="banner<?php echo $module; ?>" class="banner special_product">
      <?php foreach ($banners as $banner) { ?>
      <?php if ($banner['link']) { ?>
      <div><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" /></a></div>
      <div class="name" style="margin-bottom: 4px;">
        <a href="<?php echo $banner['link']; ?>">Vú Sữa (1 thùng 10 lbs )</a>
      </div>
      <div>
        <a href="<?php echo $banner['link']; ?>" type="button" class="button">
          Muốn đặt vú sữa <br/> vui lòng click vào đây
        </a>
      </div>
      <?php } else { ?>
      <div><img src="<?php echo $banner['image']; ?>" /></div>
      <?php } ?>
      <?php } ?>
    </div>
</div>
</div>
</div>
<?php }else{ ?>
  <div id="banner<?php echo $module; ?>" class="banner">
    <?php foreach ($banners as $banner) { ?>
    <?php if ($banner['link']) { ?>
    <div><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" /></a></div>
    <?php } else { ?>
    <div><img src="<?php echo $banner['image']; ?>" /></div>
    <?php } ?>
    <?php } ?>
  </div>
<?php } ?>