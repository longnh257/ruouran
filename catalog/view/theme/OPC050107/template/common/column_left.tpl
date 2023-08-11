<?php if ($modules) { ?>
<aside id="column-left" role="complementary">
 <div class="box-heading" style="padding-bottom:9px"><?php echo $coming_soon; ?></div>
  <div style="padding:10px; border:solid 1px #dbdbdb">
  <?php foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
  </div>
</aside>
<?php } ?> 
