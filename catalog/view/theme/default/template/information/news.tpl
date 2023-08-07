<?php echo $header; ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <?php if (isset($news_info)) { ?>
    <div class="content-news">
      <div class="news" <?php if ($image) { echo 'style="min-height:' . $min_height . 'px;"'; } ?>>
        <?php if ($image) { ?>
          <div class="image">
            <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a>
          </div>
        <?php } ?>
        <h3><?php echo $heading_title; ?></h3>
        <?php echo $description; ?>
      </div>
      <div class="buttons">
        <div class="right">
          <a onclick="location='<?php echo $news; ?>'" class="button"><span><?php echo $button_news; ?></span></a>
          <a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a>
        </div>
      </div>
    </div>
  <?php } elseif (isset($news_data)) { ?>
    <?php foreach ($news_data as $news) { ?>
      <div class="panelcollapsed">
        <h2><?php echo $news['title']; ?></h2>
        <div class="panelcontent">
          <?php echo $news['description']; ?><br />
          <p style="margin-top: 20px; float: right"><a href="<?php echo $news['href']; ?>"> <?php echo $text_more; ?></a></p>
          <p></p>
          <a href="<?php echo $news['href']; ?>"><img src="catalog/view/theme/default/image/message-news.png" alt="" /></a> <b><?php echo $text_posted; ?></b><?php echo $news['posted']; ?>
        </div>
      </div>
    <?php } ?>
    <div class="buttons">
      <div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
    </div>
  <?php } ?>
  <?php echo $content_bottom; ?>
</div>


<?php echo $footer; ?>