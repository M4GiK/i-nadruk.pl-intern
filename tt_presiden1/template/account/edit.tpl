<?php echo $header; ?>
<ul class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
	<?php } ?>
</ul>
<div class="container">
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset id="type_of_customer">
          <legend><?php echo $text_type_of_customer; ?></legend>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_customer_type; ?></label>
            <div class="col-sm-10">
              <label for="company_type_answer" class="radio-inline">
                <input id='individual_client' type="radio" name="customer_type" value="0" <?php if (!$customer_type) { ?> checked="checked" <?php } ?>  />
                <?php echo $text_client; ?>
              </label>
              <label class="radio-inline">
                <input id='company' type="radio" name="customer_type" value="1" <?php if ($customer_type) { ?> checked="checked" <?php } ?>/>
                <?php echo $text_company; ?>
              </label>
            </div>
          </div>
        </fieldset>
        <fieldset>
          <legend><?php echo $text_your_details; ?></legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-firstname"><?php echo $entry_firstname; ?> </label>
            <div class="col-sm-10">
              <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
              <?php if ($error_firstname) { ?>
              <div class="text-danger"><?php echo $error_firstname; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
            <div class="col-sm-10">
              <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
              <?php if ($error_lastname) { ?>
              <div class="text-danger"><?php echo $error_lastname; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-10">
              <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
            <div class="col-sm-10">
              <input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
              <?php if ($error_telephone) { ?>
              <div class="text-danger"><?php echo $error_telephone; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
            <div class="col-sm-10">
              <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control" />
            </div>
          </div>
          <?php foreach ($custom_fields as $custom_field) { ?>
          <?php if ($custom_field['location'] == 'account') { ?>
          <?php if ($custom_field['type'] == 'select') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'radio') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="radio">
                  <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'checkbox') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="checkbox">
                  <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $account_custom_field[$custom_field['custom_field_id']])) { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'text') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'textarea') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'file') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'date') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group date">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'time') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group time">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'datetime') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group datetime">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php } ?>
          <?php } ?>
        </fieldset>

        <fieldset id="company_data">
          <legend><?php echo $text_your_company; ?></legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-company_name"><?php echo $entry_company; ?> </label>
            <div class="col-sm-10">
              <input type="text" name="company" value="<?php echo $company; ?>" placeholder="<?php echo $entry_company; ?>" id="input-company_name" class="form-control" />
              <?php if ($error_company_name) { ?>
              <div class="text-danger"><?php echo $error_company_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-company_nip"><?php echo $entry_nip; ?> </label>
            <div class="col-sm-10">
              <input type="text" name="nip" value="<?php echo $nip; ?>" placeholder="<?php echo $entry_nip; ?>" id="input-company_nip" class="form-control" />
              <?php if ($error_company_nip) { ?>
              <div class="text-danger"><?php echo $error_company_nip; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-company_address"><?php echo $entry_company_address; ?> </label>
            <div class="col-sm-10">
              <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_company_address; ?>" id="input-company_address" class="form-control" />
              <?php if ($error_company_address) { ?>
              <div class="text-danger"><?php echo $error_company_address; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-company_postcode"><?php echo $entry_company_postcode; ?> </label>
            <div class="col-sm-10">
              <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_company_postcode; ?>" id="input-company_postcode" class="form-control" />
              <?php if ($error_company_postcode) { ?>
              <div class="text-danger"><?php echo $error_company_postcode; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-company_city"><?php echo $entry_company_city; ?> </label>
            <div class="col-sm-10">
                <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_company_city; ?>" id="input-company_city" class="form-control" />
                <?php if ($error_company_city) { ?>
                    <div class="text-danger"><?php echo $error_company_city; ?></div>
                <?php } ?>
              </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
            <div class="col-sm-10">
                <select name="country_id" id="input-country" class="form-control">
                    <option value=""><?php echo $text_select; ?></option>
                    <?php foreach ($countries as $country) { ?>
                        <?php if ($country['country_id'] == $country_id) { ?>
                            <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                        <?php } else { ?>
                            <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                        <?php } ?>
                    <?php } ?>
                </select>
                <?php if ($error_country) { ?>
                    <div class="text-danger"><?php echo $error_country; ?></div>
                <?php } ?>
            </div>
        </div>
          <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-zone"><?php echo $entry_zone; ?></label>
                <div class="col-sm-10">
                    <select name="zone_id" id="input-zone" class="form-control">
                    </select>
                    <?php if ($error_zone) { ?>
                        <div class="text-danger"><?php echo $error_zone; ?></div>
                    <?php } ?>
                </div>
            </div>
            <?php foreach ($address_custom_fields as $address_custom_field) { ?>
                <?php if ($address_custom_field['location'] == 'address') { ?>
                    <?php if ($address_custom_field['type'] == 'select') { ?>
                        <div class="form-group<?php echo ($address_custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $address_custom_field['sort_order']; ?>">
                            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $address_custom_field['custom_field_id']; ?>"><?php echo $address_custom_field['name']; ?></label>
                            <div class="col-sm-10">
                                <select name="custom_field[<?php echo $address_custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $address_custom_field['custom_field_id']; ?>" class="form-control">
                                    <option value=""><?php echo $text_select; ?></option>
                                    <?php foreach ($address_custom_field['custom_field_value'] as $address_custom_field_value) { ?>
                                        <?php if (isset($address_custom_field[$address_custom_field['custom_field_id']]) && $address_custom_field_value['custom_field_value_id'] == $address_custom_field[$address_custom_field['custom_field_id']]) { ?>
                                            <option value="<?php echo $address_custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $address_custom_field_value['name']; ?></option>
                                        <?php } else { ?>
                                            <option value="<?php echo $address_custom_field_value['custom_field_value_id']; ?>"><?php echo $address_custom_field_value['name']; ?></option>
                                        <?php } ?>
                                    <?php } ?>
                                </select>
                                <?php if (isset($error_address_custom_field[$address_custom_field['custom_field_id']])) { ?>
                                    <div class="text-danger"><?php echo $error_address_custom_field[$address_custom_field['custom_field_id']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                    <?php } ?>
                    <?php if ($address_custom_field['type'] == 'radio') { ?>
                        <div class="form-group<?php echo ($address_custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $address_custom_field['sort_order']; ?>">
                            <label class="col-sm-2 control-label"><?php echo $address_custom_field['name']; ?></label>
                            <div class="col-sm-10">
                                <div>
                                    <?php foreach ($address_custom_field['custom_field_value'] as $address_custom_field_value) { ?>
                                        <div class="radio">
                                            <?php if (isset($address_custom_field[$address_custom_field['custom_field_id']]) && $address_custom_field_value['custom_field_value_id'] == $address_custom_field[$address_custom_field['custom_field_id']]) { ?>
                                                <label>
                                                    <input type="radio" name="custom_field[<?php echo $address_custom_field['custom_field_id']; ?>]" value="<?php echo $address_custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                                    <?php echo $address_custom_field_value['name']; ?></label>
                                            <?php } else { ?>
                                                <label>
                                                    <input type="radio" name="custom_field[<?php echo $address_custom_field['custom_field_id']; ?>]" value="<?php echo $address_custom_field_value['custom_field_value_id']; ?>" />
                                                    <?php echo $address_custom_field_value['name']; ?></label>
                                            <?php } ?>
                                        </div>
                                    <?php } ?>
                                </div>
                                <?php if (isset($error_address_custom_field[$address_custom_field['custom_field_id']])) { ?>
                                    <div class="text-danger"><?php echo $error_address_custom_field[$address_custom_field['custom_field_id']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                    <?php } ?>
                    <?php if ($address_custom_field['type'] == 'checkbox') { ?>
                        <div class="form-group<?php echo ($address_custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $address_custom_field['sort_order']; ?>">
                            <label class="col-sm-2 control-label"><?php echo $address_custom_field['name']; ?></label>
                            <div class="col-sm-10">
                                <div>
                                    <?php foreach ($address_custom_field['custom_field_value'] as $address_custom_field_value) { ?>
                                        <div class="checkbox">
                                            <?php if (isset($address_custom_field[$address_custom_field['custom_field_id']]) && in_array($address_custom_field_value['custom_field_value_id'], $address_custom_field[$address_custom_field['custom_field_id']])) { ?>
                                                <label>
                                                    <input type="checkbox" name="custom_field[<?php echo $address_custom_field['custom_field_id']; ?>][]" value="<?php echo $address_custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                                    <?php echo $address_custom_field_value['name']; ?></label>
                                            <?php } else { ?>
                                                <label>
                                                    <input type="checkbox" name="custom_field[<?php echo $address_custom_field['custom_field_id']; ?>][]" value="<?php echo $address_custom_field_value['custom_field_value_id']; ?>" />
                                                    <?php echo $address_custom_field_value['name']; ?></label>
                                            <?php } ?>
                                        </div>
                                    <?php } ?>
                                </div>
                                <?php if (isset($error_address_custom_field[$address_custom_field['custom_field_id']])) { ?>
                                    <div class="text-danger"><?php echo $error_address_custom_field[$address_custom_field['custom_field_id']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                    <?php } ?>
                    <?php if ($address_custom_field['type'] == 'text') { ?>
                        <div class="form-group<?php echo ($address_custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $address_custom_field['sort_order']; ?>">
                            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $address_custom_field['custom_field_id']; ?>"><?php echo $address_custom_field['name']; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="custom_field[<?php echo $address_custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$address_custom_field['custom_field_id']]) ? $address_custom_field[$address_custom_field['custom_field_id']] : $address_custom_field['value']); ?>" placeholder="<?php echo $address_custom_field['name']; ?>" id="input-custom-field<?php echo $address_custom_field['custom_field_id']; ?>" class="form-control" />
                                <?php if (isset($error_address_custom_field[$address_custom_field['custom_field_id']])) { ?>
                                    <div class="text-danger"><?php echo $error_address_custom_field[$address_custom_field['custom_field_id']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                    <?php } ?>
                    <?php if ($address_custom_field['type'] == 'textarea') { ?>
                        <div class="form-group<?php echo ($address_custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $address_custom_field['sort_order']; ?>">
                            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $address_custom_field['custom_field_id']; ?>"><?php echo $address_custom_field['name']; ?></label>
                            <div class="col-sm-10">
                                <textarea name="custom_field[<?php echo $address_custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $address_custom_field['name']; ?>" id="input-custom-field<?php echo $address_custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($address_custom_field[$address_custom_field['custom_field_id']]) ? $address_custom_field[$address_custom_field['custom_field_id']] : $address_custom_field['value']); ?></textarea>
                                <?php if (isset($error_address_custom_field[$address_custom_field['custom_field_id']])) { ?>
                                    <div class="text-danger"><?php echo $error_address_custom_field[$address_custom_field['custom_field_id']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                    <?php } ?>
                    <?php if ($address_custom_field['type'] == 'file') { ?>
                        <div class="form-group<?php echo ($address_custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $address_custom_field['sort_order']; ?>">
                            <label class="col-sm-2 control-label"><?php echo $address_custom_field['name']; ?></label>
                            <div class="col-sm-10">
                                <button type="button" id="button-custom-field<?php echo $address_custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                                <input type="hidden" name="custom_field[<?php echo $address_custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$address_custom_field['custom_field_id']]) ? $address_custom_field[$address_custom_field['custom_field_id']] : ''); ?>" />
                                <?php if (isset($error_address_custom_field[$address_custom_field['custom_field_id']])) { ?>
                                    <div class="text-danger"><?php echo $error_address_custom_field[$address_custom_field['custom_field_id']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                    <?php } ?>
                    <?php if ($address_custom_field['type'] == 'date') { ?>
                        <div class="form-group<?php echo ($address_custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $address_custom_field['sort_order']; ?>">
                            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $address_custom_field['custom_field_id']; ?>"><?php echo $address_custom_field['name']; ?></label>
                            <div class="col-sm-10">
                                <div class="input-group date">
                                    <input type="text" name="custom_field[<?php echo $address_custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$address_custom_field['custom_field_id']]) ? $address_custom_field[$address_custom_field['custom_field_id']] : $address_custom_field['value']); ?>" placeholder="<?php echo $address_custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $address_custom_field['custom_field_id']; ?>" class="form-control" />
                                    <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                <?php if (isset($error_address_custom_field[$address_custom_field['custom_field_id']])) { ?>
                                    <div class="text-danger"><?php echo $error_address_custom_field[$address_custom_field['custom_field_id']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                    <?php } ?>
                    <?php if ($address_custom_field['type'] == 'time') { ?>
                        <div class="form-group<?php echo ($address_custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $address_custom_field['sort_order']; ?>">
                            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $address_custom_field['custom_field_id']; ?>"><?php echo $address_custom_field['name']; ?></label>
                            <div class="col-sm-10">
                                <div class="input-group time">
                                    <input type="text" name="custom_field[<?php echo $address_custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$address_custom_field['custom_field_id']]) ? $address_custom_field[$address_custom_field['custom_field_id']] : $address_custom_field['value']); ?>" placeholder="<?php echo $address_custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $address_custom_field['custom_field_id']; ?>" class="form-control" />
                                    <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                <?php if (isset($error_address_custom_field[$address_custom_field['custom_field_id']])) { ?>
                                    <div class="text-danger"><?php echo $error_address_custom_field[$address_custom_field['custom_field_id']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                    <?php } ?>
                    <?php if ($address_custom_field['type'] == 'datetime') { ?>
                        <div class="form-group<?php echo ($address_custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $address_custom_field['sort_order']; ?>">
                            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $address_custom_field['custom_field_id']; ?>"><?php echo $address_custom_field['name']; ?></label>
                            <div class="col-sm-10">
                                <div class="input-group datetime">
                                    <input type="text" name="custom_field[<?php echo $address_custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$address_custom_field['custom_field_id']]) ? $address_custom_field[$address_custom_field['custom_field_id']] : $address_custom_field['value']); ?>" placeholder="<?php echo $address_custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $address_custom_field['custom_field_id']; ?>" class="form-control" />
                                    <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                <?php if (isset($error_address_custom_field[$address_custom_field['custom_field_id']])) { ?>
                                    <div class="text-danger"><?php echo $error_address_custom_field[$address_custom_field['custom_field_id']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                    <?php } ?>
                <?php } ?>
            <?php } ?>
        </fieldset>

        <div class="buttons clearfix">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
// Sort the custom fields
$('.form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('.form-group').length) {
		$('.form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('.form-group').length) {
		$('.form-group:last').after(this);
	}

	if ($(this).attr('data-sort') == $('.form-group').length) {
		$('.form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('.form-group').length) {
		$('.form-group:first').before(this);
	}
});
//--></script>
<script type="text/javascript"><!--
$('button[id^=\'button-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$(node).parent().find('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});

$(document).ready(function(){
    if ($("input[type='radio']:checked").val() > 0) {
        $("#company_data").show();
    } else {
        $("#company_data").hide();
    }

    // add functionality for the onclicks here
    $("#individual_client").click(function() {
        $("#company_data").hide("slide", { direction: "up" }, 'slow');
        $("#company_data > :first-child").removeClass("required");
        $("#company_data > :nth-child(2)").removeClass("required");
    });

    $("#company").click(function() {
        $("#company_data").show("slide", { direction: "up" }, 'slow');
        $("#company_data > :first-child").addClass("required");
        $("#company_data > :nth-child(2)").addClass("required");
    });
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});
//--></script>
<script type="text/javascript"><!--
    $('select[name=\'country_id\']').on('change', function() {
        $.ajax({
            url: 'index.php?route=account/account/country&country_id=' + this.value,
            dataType: 'json',
            beforeSend: function() {
                $('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
            },
            complete: function() {
                $('.fa-spin').remove();
            },
            success: function(json) {
                if (json['postcode_required'] == '1') {
                    $('input[name=\'postcode\']').parent().parent().addClass('required');
                } else {
                    $('input[name=\'postcode\']').parent().parent().removeClass('required');
                }

                html = '<option value=""><?php echo $text_select; ?></option>';

                if (json['zone'] && json['zone'] != '') {
                    for (i = 0; i < json['zone'].length; i++) {
                        html += '<option value="' + json['zone'][i]['zone_id'] + '"';

                        if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                            html += ' selected="selected"';
                        }

                        html += '>' + json['zone'][i]['name'] + '</option>';
                    }
                } else {
                    html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
                }

                $('select[name=\'zone_id\']').html(html);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $('select[name=\'country_id\']').trigger('change');
//--></script>
<?php echo $footer; ?>
