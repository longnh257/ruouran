<?php 
class ModelPaymentStripePayments extends Model {
	public function getMethod($address, $total) {
		$this->language->load('payment/stripe_payments');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('stripe_payments_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

	    if ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = array();

		if ($status) {
			$method_data = array(
				'code'       => 'stripe_payments',
				'title'      => $this->language->get('text_title'),
				'sort_order' => $this->config->get('stripe_payments_sort_order')
			);
		}

		return $method_data;
	}
}
?>