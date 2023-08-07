<?php if ($news) { ?>
  <?php if ($box) { ?>
    <div class="box">
      <div class="box-heading">
        <?php if ($icon) { ?>
          <div style="float:left; margin-right:8px;"><img src="catalog/view/theme/default/image/message.png" alt="" /></div>
        <?php } ?>
        <?php if ($customtitle) { ?>
          <?php echo $customtitle; ?>
        <?php } ?>
      </div>
      <div class="box-content">
        <?php foreach ($news as $news_story) { ?>
          <div class="box-news">
            <?php if ($show_headline) { ?>
              <h4><?php echo $news_story['title']; ?></h4>
            <?php } ?>
			<?php if ($news_story['image']) { ?>
              <div style="float:right; padding:0px 0px 5px 5px;">
                <a href="<?php echo $news_story['href']; ?>" title=""><img src="<?php echo $news_story['image']; ?>" alt="<?php echo $news_story['title']; ?>" /></a>
              </div>
            <?php } ?>
            <?php echo $news_story['description']; ?>
            <a href="<?php echo $news_story['href']; ?>"> <?php echo $text_more; ?></a>
			<br />
            <a href="<?php echo $news_story['href']; ?>"><img src="catalog/view/theme/default/image/message-news.png" alt="" /></a>
            <span><b><?php echo $text_posted; ?></b> <?php echo $news_story['posted']; ?></span>
          </div>
        <?php } ?>
        <?php if ($showbutton) { ?>
          <div style="text-align:right;">
            <a href="<?php echo $newslist; ?>" class="button"><span><?php echo $buttonlist; ?></span></a>
          </div>
        <?php } ?>
      </div>
    </div>
  <?php } else { ?>
    <div style="margin-bottom:10px;">
      <?php foreach ($news as $news_story) { ?>
        <div class="box-news">
          <?php if ($show_headline) { ?>
            <h4><?php echo $news_story['title']; ?></h4>
          <?php } ?>
		  <?php if ($news_story['image']) { ?>
            <div style="float:right; padding:0px 0px 5px 5px;">
              <a href="<?php echo $news_story['href']; ?>" title=""><img src="<?php echo $news_story['image']; ?>" alt="<?php echo $news_story['title']; ?>" /></a>
            </div>
          <?php } ?>
          <?php echo $news_story['description']; ?>
          <a href="<?php echo $news_story['href']; ?>"> <?php echo $text_more; ?></a>
		  <br />
          <a href="<?php echo $news_story['href']; ?>"><img src="catalog/view/theme/default/image/message-news.png" alt="" /></a>
          <span><b><?php echo $text_posted; ?></b> <?php echo $news_story['posted']; ?></span>
        </div>
      <?php } ?>
      <?php if ($showbutton) { ?>
        <div style="text-align:right;">
          <a href="<?php echo $newslist; ?>" class="button"><span><?php echo $buttonlist; ?></span></a>
        </div>
      <?php } ?>
    </div>
  <?php } ?>
<?php } ?>