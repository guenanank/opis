<div class="row">
  <div class="col-sm-12">
    <div class="pull-right">
      <a href="<?php echo base_url('brand') ?>" class="btn btn-secondary">
        <i class="fa fa-arrow-left"></i>&nbsp;Kembali
      </a>
    </div>
  </div>
</div>
<div class="card mt-3">
  <div class="card-header">
    <i class="fa fa-plus"></i>Tambah&nbsp;<?php echo $title ?>
  </div>
  <div class="card-body">
    <?php echo form_open('brand/insert', ['class' => 'ajaxform', 'data-module' => 'brand']) ?>
    <div class="form-row mb-2">
      <div class="form-group col-md-12">
        <?php echo form_label('Nama', 'brand-name') ?>
        <?php echo form_input(['name' => 'name', 'id' => 'brand-name', 'class' => 'form-control', 'placeholder' => sprintf('Nama %s', $title)]) ?>
        <div id="feedback-name"></div>
      </div>
    </div>
    <div class="form-row mb-2">
      <div class="form-group col-md-12">
        <?php echo form_label('Sub Dari Merek', 'brand-sub_from') ?>
        <select name="sub_from" class="form-control selectpicker" id="brand-sub_from" title="Pilih <?php echo $title ?>">
        <?php
          foreach ($parents as $key => $value) {
            ?>
              <option value="<?php echo $key ?>" <?php echo set_select('sub_from', $key) ?>>
                <?php echo $value ?>
              </option>
            <?php
          }
        ?>
        </select>
        <div id="feedback-sub_from"></div>
      </div>
    </div>
    <div class="form-row mb-2">
      <div class="form-group col-md-12">
        <?php echo form_label('Tipe', 'brand-type') ?>
        <select name="type" class="form-control selectpicker" id="brand-type" title="Pilih Tipe <?php echo $title ?>">
        <?php
          foreach ($types as $key => $value) {
            ?>
              <option value="<?php echo $key ?>" <?php echo set_select('type', $key) ?>>
                <?php echo $value ?>
              </option>
            <?php
          }
        ?>
        </select>
        <div id="feedback-type"></div>
      </div>
    </div>
    <?php include APPPATH . 'views/button_form.php' ?>
    <?php echo form_close() ?>
  </div>
</div>
