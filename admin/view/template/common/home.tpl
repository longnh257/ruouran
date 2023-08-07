<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_install) { ?>
  <div class="warning"><?php echo $error_install; ?></div>
  <?php } ?>
  <?php if ($error_image) { ?>
  <div class="warning"><?php echo $error_image; ?></div>
  <?php } ?>
  <?php if ($error_image_cache) { ?>
  <div class="warning"><?php echo $error_image_cache; ?></div>
  <?php } ?>
  <?php if ($error_cache) { ?>
  <div class="warning"><?php echo $error_cache; ?></div>
  <?php } ?>
  <?php if ($error_download) { ?>
  <div class="warning"><?php echo $error_download; ?></div>
  <?php } ?>
  <?php if ($error_logs) { ?>
  <div class="warning"><?php echo $error_logs; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/home.png" alt="" /> <?php echo $heading_title; ?></h1>
    </div>
    <div class="content">
      <div class="overview">
        <div class="dashboard-heading"><?php echo $text_overview; ?></div>
        <div class="dashboard-content">
          <table>
            <tr>
              <td><?php echo $text_total_sale; ?></td>
              <td><?php echo $total_sale; ?></td>
            </tr>
            <tr>
              <td><?php echo $text_total_sale_year; ?></td>
              <td><?php echo $total_sale_year; ?></td>
            </tr>
            <tr>
              <td><?php echo $text_total_order; ?></td>
              <td><?php echo $total_order; ?></td>
            </tr>
            <tr>
              <td><?php echo $text_total_customer; ?></td>
              <td><?php echo $total_customer; ?></td>
            </tr>
            <tr>
              <td><?php echo $text_total_customer_approval; ?></td>
              <td><?php echo $total_customer_approval; ?></td>
            </tr>
            <tr>
              <td><?php echo $text_total_review_approval; ?></td>
              <td><?php echo $total_review_approval; ?></td>
            </tr>
            <tr>
              <td><?php echo $text_total_affiliate; ?></td>
              <td><?php echo $total_affiliate; ?></td>
            </tr>
            <tr>
              <td><?php echo $text_total_affiliate_approval; ?></td>
              <td><?php echo $total_affiliate_approval; ?></td>
            </tr>
          </table>
        </div>
      </div>
      <div class="statistic">
        <div class="range"><?php echo $entry_range; ?>
          <select id="range" onchange="getSalesChart(this.value)">
            <option value="day"><?php echo $text_day; ?></option>
            <option value="week"><?php echo $text_week; ?></option>
            <option value="month"><?php echo $text_month; ?></option>
            <option value="year"><?php echo $text_year; ?></option>
          </select>
        </div>
        <div class="dashboard-heading"><?php echo $text_statistics; ?></div>
        <div class="dashboard-content">
          <div id="report" style="width: 390px; height: 170px; margin: auto;"></div>
        </div>
      </div>
      <div class="latest">
        <div class="dashboard-heading"><?php echo $text_latest_10_orders; ?></div>
        <div class="dashboard-content">
          <table class="list">
            <thead>
              <tr>
                <td class="right"><?php echo $column_order; ?></td>
                <td class="left"><?php echo $column_customer; ?></td>
                <td class="left"><?php echo $column_status; ?></td>
                <td class="left"><?php echo $column_date_added; ?></td>
                <td class="right"><?php echo $column_total; ?></td>
                <td class="right"><?php echo $column_action; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php if ($orders) { ?>
              <?php foreach ($orders as $order) { ?>
              <tr>
                <td class="right"><?php echo $order['order_id']; ?></td>
                <td class="left"><?php echo $order['customer']; ?></td>
                <td class="left"><?php echo $order['status']; ?></td>
                <td class="left"><?php echo $order['date_added']; ?></td>
                <td class="right"><?php echo $order['total']; ?></td>
                <td class="right"><?php foreach ($order['action'] as $action) { ?>
                  [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                  <?php } ?></td>
              </tr>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="center" colspan="6"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </div>
      <div class="box">
        <div class="heading">
          <h1><img src="view/image/report.png" alt="" /> <?php echo $text_sales_report; ?></h1>
          <div class="buttons">
            <a onclick="filter();" class="button"><?php echo $button_filter; ?></a>
            <a onclick="sendEmail();" class="button"><?php echo $button_resend_email; ?></a>
          </div>
        </div>
        <div class="dashboard-content">
          <table class="form">
            <tr>
              <td><?php echo $entry_date_start; ?>
                <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" id="date-start" size="12" /></td>
              <td><?php echo $entry_date_end; ?>
                <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" id="date-end" size="12" /></td>
              <td><?php echo $entry_id_start; ?>
                <input type="text" name="filter_id_start" value="<?php echo $filter_id_start; ?>" id="id-start" size="12" /></td>
              <td><?php echo $entry_id_end; ?>
                <input type="text" name="filter_id_end" value="<?php echo $filter_id_end; ?>" id="id-end" size="12" /></td>
              <td><?php echo $entry_product; ?>
                <select name="filter_order_product_id">
                  <option value="0"><?php echo $text_all_products; ?></option>
                  <?php foreach ($products as $product) { ?>
                  <?php if ($product['product_id'] == $filter_order_product_id) { ?>
                  <option value="<?php echo $product['product_id']; ?>" selected="selected"><?php echo $product['model']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $product['product_id']; ?>"><?php echo $product['model']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td><?php echo $entry_status; ?>
                <select name="filter_order_status_id">
                  <option value="0"><?php echo $text_all_status; ?></option>
                  <?php foreach ($order_statuses as $order_status) { ?>
                  <?php if ($order_status['order_status_id'] == $filter_order_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
          <table class="list">
            <thead>
            <tr>
              <td class="right"><?php echo $column_order; ?></td>
              <td class="left"><?php echo $column_customer; ?></td>
              <td class="left"><?php echo $column_product; ?></td>
              <td class="right"><?php echo $column_total; ?></td>
              <td class="left"><?php echo $column_status; ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
            </thead>
            <tbody>
            <?php if ($sales_reports) { ?>
            <?php foreach ($sales_reports as $sales_report) { ?>
            <tr>
              <td class="right"><?php echo $sales_report['order_id']; ?></td>
              <td class="left"><?php echo $sales_report['firstname']." ".$sales_report['lastname']; ?></td>
              <td class="left"><?php echo $sales_report['model']; ?></td>
              <td class="right"><?php echo $sales_report['total']; ?></td>
              <td class="left"><?php echo $sales_report['order_status']; ?></td>
              <td class="right"><?php foreach ($sales_report['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="6"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
            </tbody>
          </table>
          <div class="pagination"><?php echo $pagination; ?></div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--[if IE]>
<script type="text/javascript" src="view/javascript/jquery/flot/excanvas.js"></script>
<![endif]--> 
<script type="text/javascript" src="view/javascript/jquery/flot/jquery.flot.js"></script> 
<script type="text/javascript"><!--
function getSalesChart(range) {
	$.ajax({
		type: 'get',
		url: 'index.php?route=common/home/chart&token=<?php echo $token; ?>&range=' + range,
		dataType: 'json',
		async: false,
		success: function(json) {
			var option = {	
				shadowSize: 0,
				lines: { 
					show: true,
					fill: true,
					lineWidth: 1
				},
				grid: {
					backgroundColor: '#FFFFFF'
				},	
				xaxis: {
            		ticks: json.xaxis
				}
			}

			$.plot($('#report'), [json.order, json.customer], option);
		}
	});
}

getSalesChart($('#range').val());
//--></script>
<script type="text/javascript"><!--
  $(document).ready(function() {
    $('#date-start').datepicker({dateFormat: 'yy-mm-dd'});

    $('#date-end').datepicker({dateFormat: 'yy-mm-dd'});
  });
  //--></script>
<script type="text/javascript"><!--
  function filter() {
    url = 'index.php?route=common/home&token=<?php echo $token; ?>';

    var filter_date_start = $('input[name=\'filter_date_start\']').attr('value');

    if (filter_date_start) {
      url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
    }

    var filter_date_end = $('input[name=\'filter_date_end\']').attr('value');

    if (filter_date_end) {
      url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
    }

    var filter_id_start = $('input[name=\'filter_id_start\']').attr('value');

    if (filter_id_start) {
      url += '&filter_id_start=' + encodeURIComponent(filter_id_start);
    }

    var filter_id_end = $('input[name=\'filter_id_end\']').attr('value');

    if (filter_id_end) {
      url += '&filter_id_end=' + encodeURIComponent(filter_id_end);
    }

    var filter_order_product_id = $('select[name=\'filter_order_product_id\']').attr('value');

    if (filter_order_product_id != '*') {
      url += '&filter_order_product_id=' + encodeURIComponent(filter_order_product_id);
    }

    var filter_order_status_id = $('select[name=\'filter_order_status_id\']').attr('value');

    if (filter_order_status_id != '*') {
      url += '&filter_order_status_id=' + encodeURIComponent(filter_order_status_id);
    }


    location = url;
  }

  function sendEmail() {
    url = 'index.php?route=common/home/sendEmail&token=<?php echo $token; ?>';

    var filter_date_start = $('input[name=\'filter_date_start\']').attr('value');

    if (filter_date_start) {
      url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
    }

    var filter_date_end = $('input[name=\'filter_date_end\']').attr('value');

    if (filter_date_end) {
      url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
    }

    var filter_id_start = $('input[name=\'filter_id_start\']').attr('value');

    if (filter_id_start) {
      url += '&filter_id_start=' + encodeURIComponent(filter_id_start);
    }

    var filter_id_end = $('input[name=\'filter_id_end\']').attr('value');

    if (filter_id_end) {
      url += '&filter_id_end=' + encodeURIComponent(filter_id_end);
    }

    var filter_order_product_id = $('select[name=\'filter_order_product_id\']').attr('value');

    if (filter_order_product_id != '*') {
      url += '&filter_order_product_id=' + encodeURIComponent(filter_order_product_id);
    }

    var filter_order_status_id = $('select[name=\'filter_order_status_id\']').attr('value');

    if (filter_order_status_id != '*') {
      url += '&filter_order_status_id=' + encodeURIComponent(filter_order_status_id);
    }


    location = url;
  }
  //--></script>
<?php echo $footer; ?>