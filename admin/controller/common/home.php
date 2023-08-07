<?php

class ControllerCommonHome extends Controller
{
    public function index()
    {
        $this->language->load('common/home');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_overview']                 = $this->language->get('text_overview');
        $this->data['text_statistics']               = $this->language->get('text_statistics');
        $this->data['text_latest_10_orders']         = $this->language->get('text_latest_10_orders');
        $this->data['text_total_sale']               = $this->language->get('text_total_sale');
        $this->data['text_total_sale_year']          = $this->language->get('text_total_sale_year');
        $this->data['text_total_order']              = $this->language->get('text_total_order');
        $this->data['text_total_customer']           = $this->language->get('text_total_customer');
        $this->data['text_total_customer_approval']  = $this->language->get('text_total_customer_approval');
        $this->data['text_total_review_approval']    = $this->language->get('text_total_review_approval');
        $this->data['text_total_affiliate']          = $this->language->get('text_total_affiliate');
        $this->data['text_total_affiliate_approval'] = $this->language->get('text_total_affiliate_approval');
        $this->data['text_day']                      = $this->language->get('text_day');
        $this->data['text_week']                     = $this->language->get('text_week');
        $this->data['text_month']                    = $this->language->get('text_month');
        $this->data['text_year']                     = $this->language->get('text_year');
        $this->data['text_no_results']               = $this->language->get('text_no_results');

        $this->data['column_order']      = $this->language->get('column_order');
        $this->data['column_customer']   = $this->language->get('column_customer');
        $this->data['column_status']     = $this->language->get('column_status');
        $this->data['column_date_added'] = $this->language->get('column_date_added');
        $this->data['column_total']      = $this->language->get('column_total');
        $this->data['column_firstname']  = $this->language->get('column_firstname');
        $this->data['column_lastname']   = $this->language->get('column_lastname');
        $this->data['column_action']     = $this->language->get('column_action');

        $this->data['entry_range'] = $this->language->get('entry_range');

        // Check install directory exists
        if (is_dir(dirname(DIR_APPLICATION) . '/install')) {
            $this->data['error_install'] = $this->language->get('error_install');
        }
        else {
            $this->data['error_install'] = '';
        }

        // Check image directory is writable
        $file = DIR_IMAGE . 'test';

        $handle = fopen($file, 'a+');

        fwrite($handle, '');

        fclose($handle);

        if (!file_exists($file)) {
            $this->data['error_image'] = sprintf($this->language->get('error_image'), DIR_IMAGE);
        }
        else {
            $this->data['error_image'] = '';

            unlink($file);
        }

        // Check image cache directory is writable
        $file = DIR_IMAGE . 'cache/test';

        $handle = fopen($file, 'a+');

        fwrite($handle, '');

        fclose($handle);

        if (!file_exists($file)) {
            $this->data['error_image_cache'] = sprintf($this->language->get('error_image_cache'), DIR_IMAGE . 'cache/');
        }
        else {
            $this->data['error_image_cache'] = '';

            unlink($file);
        }

        // Check cache directory is writable
        $file = DIR_CACHE . 'test';

        $handle = fopen($file, 'a+');

        fwrite($handle, '');

        fclose($handle);

        if (!file_exists($file)) {
            $this->data['error_cache'] = sprintf($this->language->get('error_image_cache'), DIR_CACHE);
        }
        else {
            $this->data['error_cache'] = '';

            unlink($file);
        }

        // Check download directory is writable
        $file = DIR_DOWNLOAD . 'test';

        $handle = fopen($file, 'a+');

        fwrite($handle, '');

        fclose($handle);

        if (!file_exists($file)) {
            $this->data['error_download'] = sprintf($this->language->get('error_download'), DIR_DOWNLOAD);
        }
        else {
            $this->data['error_download'] = '';

            unlink($file);
        }

        // Check logs directory is writable
        $file = DIR_LOGS . 'test';

        $handle = fopen($file, 'a+');

        fwrite($handle, '');

        fclose($handle);

        if (!file_exists($file)) {
            $this->data['error_logs'] = sprintf($this->language->get('error_logs'), DIR_LOGS);
        }
        else {
            $this->data['error_logs'] = '';

            unlink($file);
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['token'] = $this->session->data['token'];

        $this->load->model('sale/order');

        $this->data['total_sale']      = $this->currency->format($this->model_sale_order->getTotalSales(), $this->config->get('config_currency'));
        $this->data['total_sale_year'] = $this->currency->format($this->model_sale_order->getTotalSalesByYear(date('Y')), $this->config->get('config_currency'));
        $this->data['total_order']     = $this->model_sale_order->getTotalOrders();

        $this->load->model('sale/customer');

        $this->data['total_customer']          = $this->model_sale_customer->getTotalCustomers();
        $this->data['total_customer_approval'] = $this->model_sale_customer->getTotalCustomersAwaitingApproval();

        $this->load->model('catalog/review');

        $this->data['total_review']          = $this->model_catalog_review->getTotalReviews();
        $this->data['total_review_approval'] = $this->model_catalog_review->getTotalReviewsAwaitingApproval();

        $this->load->model('sale/affiliate');

        $this->data['total_affiliate']          = $this->model_sale_affiliate->getTotalAffiliates();
        $this->data['total_affiliate_approval'] = $this->model_sale_affiliate->getTotalAffiliatesAwaitingApproval();

        $this->data['orders'] = array();

        $data = array(
            'sort'  => 'o.date_added',
            'order' => 'DESC',
            'start' => 0,
            'limit' => 10
        );

        $results = $this->model_sale_order->getOrders($data);

        foreach ($results as $result) {
            $action = array();

            $action[] = array(
                'text' => $this->language->get('text_view'),
                'href' => $this->url->link('sale/order/info', 'token=' . $this->session->data['token'] . '&order_id=' . $result['order_id'], 'SSL')
            );

            $this->data['orders'][] = array(
                'order_id'   => $result['order_id'],
                'customer'   => $result['customer'],
                'status'     => $result['status'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                'total'      => $this->currency->format($result['total'], $result['currency_code'], $result['currency_value']),
                'action'     => $action
            );
        }

        if ($this->config->get('config_currency_auto')) {
            $this->load->model('localisation/currency');

            $this->model_localisation_currency->updateCurrencies();
        }

        $this->template = 'common/home.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );
        // Sales Report
        $this->data['text_sales_report']   = $this->language->get('text_sales_report');
        $this->data['entry_date_start']    = $this->language->get('entry_date_start');
        $this->data['entry_date_end']      = $this->language->get('entry_date_end');
        $this->data['entry_id_start']      = $this->language->get('entry_id_start');
        $this->data['entry_id_end']        = $this->language->get('entry_id_end');
        $this->data['text_all_status']     = $this->language->get('text_all_status');
        $this->data['text_all_products']   = $this->language->get('text_all_products');
        $this->data['entry_status']        = $this->language->get('entry_status');
        $this->data['entry_product']       = $this->language->get('entry_product');
        $this->data['button_filter']       = $this->language->get('button_filter');
        $this->data['button_resend_email'] = $this->language->get('button_resend_email');
        $this->data['column_product']      = $this->language->get('column_product');

        if (isset($this->request->get['filter_date_start'])) {
            $filter_date_start = $this->request->get['filter_date_start'];
        }
        else {
            $filter_date_start = date('Y-m-d', strtotime(date('Y') . '-' . date('m') . '-01'));
//            $filter_date_start = date('Y-m-d', strtotime("-1 days"));
        }

        if (isset($this->request->get['filter_date_end'])) {
            $filter_date_end = $this->request->get['filter_date_end'];
        }
        else {
            $filter_date_end = date('Y-m-d', strtotime("-1 days"));
        }

        if (isset($this->request->get['filter_id_end'])) {
            $filter_id_end = $this->request->get['filter_id_end'];
        }
        else {
            $filter_id_end = null;
        }

        if (isset($this->request->get['filter_id_start'])) {
            $filter_id_start = $this->request->get['filter_id_start'];
        }
        else {
            $filter_id_start = null;
        }

        if (isset($this->request->get['filter_order_product_id'])) {
            $filter_order_product_id = $this->request->get['filter_order_product_id'];
        }
        else {
            $filter_order_product_id = null;
        }

        if (isset($this->request->get['filter_order_status_id'])) {
            $filter_order_status_id = $this->request->get['filter_order_status_id'];
        }
        else {
            $filter_order_status_id = null;
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        }
        else {
            $page = 1;
        }

        $this->load->model('localisation/order_status');
        $this->load->model('catalog/product');
        $this->load->model('report/sale');
        $this->data['order_statuses'] = $this->model_localisation_order_status->getOrderTwoStatuses();
        $this->data['products']       = $this->model_catalog_product->getProducts();

        $this->data['filter_date_start']       = $filter_date_start;
        $this->data['filter_date_end']         = $filter_date_end;
        $this->data['filter_id_start']         = $filter_id_start;
        $this->data['filter_id_end']           = $filter_id_end;
        $this->data['filter_order_product_id'] = $filter_order_product_id;
        $this->data['filter_order_status_id']  = $filter_order_status_id;

        $this->data['sales_reports'] = array();

        $data = array(
            'filter_date_start'       => $filter_date_start,
            'filter_date_end'         => $filter_date_end,
            'filter_id_start'         => $filter_id_start,
            'filter_id_end'           => $filter_id_end,
            'filter_order_product_id' => $filter_order_product_id,
            'filter_order_status_id'  => $filter_order_status_id,
            'sort'                    => 'o.date_added',
            'order'                   => 'DESC',
            'start'                   => ($page - 1) * $this->config->get('config_admin_limit'),
            'limit'                   => $this->config->get('config_admin_limit')
        );

        $total_sales_reports = $this->model_report_sale->getTotalReportOrders($data);

        $sales_reports = $this->model_report_sale->getReportOrders($data);

        foreach ($sales_reports as $sales_report) {
            $action = array();

            $action[] = array(
                'text' => $this->language->get('text_view'),
                'href' => $this->url->link('sale/order/info', 'token=' . $this->session->data['token'] . '&order_id=' . $sales_report['order_id'], 'SSL')
            );

            if (strtotime($sales_report['date_added']) > strtotime('-' . (int)$this->config->get('config_order_edit') . ' day')) {
                $action[] = array(
                    'text' => $this->language->get('text_edit'),
                    'href' => $this->url->link('sale/order/update', 'token=' . $this->session->data['token'] . '&order_id=' . $sales_report['order_id'], 'SSL')
                );
            }


            $this->load->model('localisation/order_status');

            $order_status_info = $this->model_localisation_order_status->getOrderStatus($sales_report['order_status_id']);

            if ($order_status_info) {
                $order_status = $order_status_info['name'];
            }
            else {
                $order_status = '';
            }

            $this->data['sales_reports'][] = array(
                'order_id'     => $sales_report['order_id'],
                'firstname'    => $sales_report['firstname'],
                'lastname'     => $sales_report['lastname'],
                'model'        => $sales_report['model'],
                'quantity'     => $sales_report['quantity'],
                'total'        => $this->currency->format($sales_report['total'], 'USD', 1),
                'order_status' => $order_status,
                'action'       => $action
            );
        }

        $url = '';

        if (isset($this->request->get['filter_date_start'])) {
            $url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
        }

        if (isset($this->request->get['filter_date_end'])) {
            $url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
        }

        if (isset($this->request->get['filter_id_end'])) {
            $url .= '&filter_id_end=' . $this->request->get['filter_id_end'];
        }

        if (isset($this->request->get['filter_id_start'])) {
            $url .= '&filter_id_start=' . $this->request->get['filter_id_start'];
        }

        if (isset($this->request->get['filter_order_product_id'])) {
            $url .= '&filter_order_product_id=' . $this->request->get['filter_order_product_id'];
        }

        if (isset($this->request->get['filter_order_status_id'])) {
            $url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
        }

        $pagination        = new Pagination();
        $pagination->total = $total_sales_reports;
        $pagination->page  = $page;
        $pagination->limit = $this->config->get('config_admin_limit');
        $pagination->text  = $this->language->get('text_pagination');
        $pagination->url   = $this->url->link('common/home', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        $this->data['pagination'] = $pagination->render();

        $this->response->setOutput($this->render());
    }

    public function sendEmail()
    {
        // Admin Alert Mail
        if ($this->config->get('config_alert_mail')) {
            if (isset($this->request->get['filter_date_start'])) {
                $filter_date_start = $this->request->get['filter_date_start'];
            }
            else {
                $filter_date_start = date('Y-m-d', strtotime(date('Y') . '-' . date('m') . '-01'));
            }

            if (isset($this->request->get['filter_date_end'])) {
                $filter_date_end = $this->request->get['filter_date_end'];
            }
            else {
                $filter_date_end = date('Y-m-d', strtotime("-1 days"));
            }

            if (isset($this->request->get['filter_id_end'])) {
                $filter_id_end = $this->request->get['filter_id_end'];
            }
            else {
                $filter_id_end = null;
            }

            if (isset($this->request->get['filter_id_start'])) {
                $filter_id_start = $this->request->get['filter_id_start'];
            }
            else {
                $filter_id_start = null;
            }

            if (isset($this->request->get['filter_order_product_id'])) {
                $filter_order_product_id = $this->request->get['filter_order_product_id'];
            }
            else {
                $filter_order_product_id = null;
            }

            if (isset($this->request->get['filter_order_status_id'])) {
                $filter_order_status_id = $this->request->get['filter_order_status_id'];
            }
            else {
                $filter_order_status_id = null;
            }

            $sql = "SELECT *
                FROM `" . DB_PREFIX . "order`";

            if (!empty($filter_order_status_id)) {
                $sql .= " WHERE order_status_id = '" . (int)$filter_order_status_id . "'";
            }
            else {
                $sql .= " WHERE order_status_id > '0'";
            }

            if (!empty($filter_id_start)) {
                $sql .= " AND order_id >= '" . (int)$filter_id_start . "'";
            }

            if (!empty($filter_id_end)) {
                $sql .= " AND order_id <= '" . (int)$filter_id_end . "'";
            }

            if (!empty($filter_date_start)) {
                $sql .= " AND DATE(date_added) >= '" . $this->db->escape($filter_date_start) . "'";
            }

            if (!empty($filter_date_end)) {
                $sql .= " AND DATE(date_added) <= '" . $this->db->escape($filter_date_end) . "'";
            }

            $orders = $this->db->query($sql);

            if (!empty($filter_order_product_id)) {
                $this->load->model('catalog/product');
                $product = $this->model_catalog_product->getProduct($filter_order_product_id);
                $subject = sprintf("%s - Report %s from %s to %s", html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'), $product['model'], $filter_date_start, $filter_date_end);
            }
            else {
                $subject = sprintf("%s - Report from %s to %s", html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'), $filter_date_start, $filter_date_end);
            }

            $text  = "";
            $total = 0;
            if ($orders->num_rows) {
                foreach ($orders->rows as $order) {
                    $this->load->model('localisation/zone');
                    $zone_info         = $this->model_localisation_zone->getZone($order['shipping_zone_id']);
                    $sql_order_product = "SELECT *
                            FROM `" . DB_PREFIX . "order_product`
                            WHERE order_id = '" . (int)$order['order_id'] . "'";
                    if (!empty($filter_order_product_id)) {
                        $sql_order_product .= " AND product_id = '" . (int)$filter_order_product_id . "'";
                    }
                    $order_products = $this->db->query($sql_order_product);
                    if ($order_products->num_rows) {
                        $text .= '<hr/>';
                        $text .= $order['firstname'] . " " . $order['lastname'] . "<br/>";
                        $text .= $order['shipping_address_1'] . "<br/>";
                        $text .= $order['shipping_city'] . " " . $zone_info['code'] . " " . $order['shipping_postcode'] . "<br/>";
                        foreach ($order_products->rows as $order_product) {
                            $total += $order_product['quantity'];
                            $text .= "<br/>";
                            $text .= "Mua " . $order_product['quantity'] . ' thùng ' . $order_product['model'];
                        }
                    }
                }
            }

            if ($total == 0) {
                $text .= 'Không có đơn đặt hàng nào.';
            }

            $text .= "<br/><br/>";
            $text .= "Total: " . $total;

            $mail            = new Mail();
            $mail->protocol  = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->hostname  = $this->config->get('config_smtp_host');
            $mail->username  = $this->config->get('config_smtp_username');
            $mail->password  = $this->config->get('config_smtp_password');
            $mail->port      = $this->config->get('config_smtp_port');
            $mail->timeout   = $this->config->get('config_smtp_timeout');
            $mail->setTo($this->config->get('config_email'));
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender("muatraicayflorida");
            $mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
            $mail->setHtml(html_entity_decode($text, ENT_QUOTES, 'UTF-8'));
            $mail->send();

            // Send to additional alert emails
            $emails = explode(',', $this->config->get('config_alert_emails'));

            foreach ($emails as $email) {
                if ($email && preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $email)) {
                    $mail->setTo($email);
                    $mail->send();
                }
            }
            $url = '';

            if (isset($this->request->get['filter_date_start'])) {
                $url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
            }

            if (isset($this->request->get['filter_date_end'])) {
                $url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
            }

            if (isset($this->request->get['filter_id_end'])) {
                $url .= '&filter_id_end=' . $this->request->get['filter_id_end'];
            }

            if (isset($this->request->get['filter_id_start'])) {
                $url .= '&filter_id_start=' . $this->request->get['filter_id_start'];
            }

            if (isset($this->request->get['filter_order_product_id'])) {
                $url .= '&filter_order_product_id=' . $this->request->get['filter_order_product_id'];
            }

            if (isset($this->request->get['filter_order_status_id'])) {
                $url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
            }

            $this->redirect($this->url->link('common/home', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL'));
        }
    }

    public function chart()
    {
        $this->language->load('common/home');

        $data = array();

        $data['order']    = array();
        $data['customer'] = array();
        $data['xaxis']    = array();

        $data['order']['label']    = $this->language->get('text_order');
        $data['customer']['label'] = $this->language->get('text_customer');

        if (isset($this->request->get['range'])) {
            $range = $this->request->get['range'];
        }
        else {
            $range = 'month';
        }

        switch ($range) {
            case 'day':
                for ($i = 0; $i < 24; $i++) {
                    $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id > '" . (int)$this->config->get('config_complete_status_id') . "' AND (DATE(date_added) = DATE(NOW()) AND HOUR(date_added) = '" . (int)$i . "') GROUP BY HOUR(date_added) ORDER BY date_added ASC");

                    if ($query->num_rows) {
                        $data['order']['data'][] = array($i, (int)$query->row['total']);
                    }
                    else {
                        $data['order']['data'][] = array($i, 0);
                    }

                    $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE DATE(date_added) = DATE(NOW()) AND HOUR(date_added) = '" . (int)$i . "' GROUP BY HOUR(date_added) ORDER BY date_added ASC");

                    if ($query->num_rows) {
                        $data['customer']['data'][] = array($i, (int)$query->row['total']);
                    }
                    else {
                        $data['customer']['data'][] = array($i, 0);
                    }

                    $data['xaxis'][] = array($i, date('H', mktime($i, 0, 0, date('n'), date('j'), date('Y'))));
                }
                break;
            case 'week':
                $date_start = strtotime('-' . date('w') . ' days');

                for ($i = 0; $i < 7; $i++) {
                    $date = date('Y-m-d', $date_start + ($i * 86400));

                    $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id > '" . (int)$this->config->get('config_complete_status_id') . "' AND DATE(date_added) = '" . $this->db->escape($date) . "' GROUP BY DATE(date_added)");

                    if ($query->num_rows) {
                        $data['order']['data'][] = array($i, (int)$query->row['total']);
                    }
                    else {
                        $data['order']['data'][] = array($i, 0);
                    }

                    $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "customer` WHERE DATE(date_added) = '" . $this->db->escape($date) . "' GROUP BY DATE(date_added)");

                    if ($query->num_rows) {
                        $data['customer']['data'][] = array($i, (int)$query->row['total']);
                    }
                    else {
                        $data['customer']['data'][] = array($i, 0);
                    }

                    $data['xaxis'][] = array($i, date('D', strtotime($date)));
                }

                break;
            default:
            case 'month':
                for ($i = 1; $i <= date('t'); $i++) {
                    $date = date('Y') . '-' . date('m') . '-' . $i;

                    $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id > '" . (int)$this->config->get('config_complete_status_id') . "' AND (DATE(date_added) = '" . $this->db->escape($date) . "') GROUP BY DAY(date_added)");

                    if ($query->num_rows) {
                        $data['order']['data'][] = array($i, (int)$query->row['total']);
                    }
                    else {
                        $data['order']['data'][] = array($i, 0);
                    }

                    $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE DATE(date_added) = '" . $this->db->escape($date) . "' GROUP BY DAY(date_added)");

                    if ($query->num_rows) {
                        $data['customer']['data'][] = array($i, (int)$query->row['total']);
                    }
                    else {
                        $data['customer']['data'][] = array($i, 0);
                    }

                    $data['xaxis'][] = array($i, date('j', strtotime($date)));
                }
                break;
            case 'year':
                for ($i = 1; $i <= 12; $i++) {
                    $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id > '" . (int)$this->config->get('config_complete_status_id') . "' AND YEAR(date_added) = '" . date('Y') . "' AND MONTH(date_added) = '" . $i . "' GROUP BY MONTH(date_added)");

                    if ($query->num_rows) {
                        $data['order']['data'][] = array($i, (int)$query->row['total']);
                    }
                    else {
                        $data['order']['data'][] = array($i, 0);
                    }

                    $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE YEAR(date_added) = '" . date('Y') . "' AND MONTH(date_added) = '" . $i . "' GROUP BY MONTH(date_added)");

                    if ($query->num_rows) {
                        $data['customer']['data'][] = array($i, (int)$query->row['total']);
                    }
                    else {
                        $data['customer']['data'][] = array($i, 0);
                    }

                    $data['xaxis'][] = array($i, date('M', mktime(0, 0, 0, $i, 1, date('Y'))));
                }
                break;
        }

        $this->response->setOutput(json_encode($data));
    }

    public function login()
    {
        $route = '';

        if (isset($this->request->get['route'])) {
            $part = explode('/', $this->request->get['route']);

            if (isset($part[0])) {
                $route .= $part[0];
            }

            if (isset($part[1])) {
                $route .= '/' . $part[1];
            }
        }

        $ignore = array(
            'common/login',
            'common/forgotten',
            'common/reset'
        );

        if (!$this->user->isLogged() && !in_array($route, $ignore)) {
            return $this->forward('common/login');
        }

        if (isset($this->request->get['route'])) {
            $ignore = array(
                'common/login',
                'common/logout',
                'common/forgotten',
                'common/reset',
                'error/not_found',
                'error/permission'
            );

            $config_ignore = array();

            if ($this->config->get('config_token_ignore')) {
                $config_ignore = unserialize($this->config->get('config_token_ignore'));
            }

            $ignore = array_merge($ignore, $config_ignore);

            if (!in_array($route, $ignore) && (!isset($this->request->get['token']) || !isset($this->session->data['token']) || ($this->request->get['token'] != $this->session->data['token']))) {
                return $this->forward('common/login');
            }
        }
        else {
            if (!isset($this->request->get['token']) || !isset($this->session->data['token']) || ($this->request->get['token'] != $this->session->data['token'])) {
                return $this->forward('common/login');
            }
        }
    }

    public function permission()
    {
        if (isset($this->request->get['route'])) {
            $route = '';

            $part = explode('/', $this->request->get['route']);

            if (isset($part[0])) {
                $route .= $part[0];
            }

            if (isset($part[1])) {
                $route .= '/' . $part[1];
            }

            $ignore = array(
                'common/home',
                'common/login',
                'common/logout',
                'common/forgotten',
                'common/reset',
                'error/not_found',
                'error/permission'
            );

            if (!in_array($route, $ignore) && !$this->user->hasPermission('access', $route)) {
                return $this->forward('error/permission');
            }
        }
    }
}

?>