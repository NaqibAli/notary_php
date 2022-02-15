<?php
include("header.php");
include("sidebar.php");
?>

<main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-car"></i> Vehicle Info</h1>
          <p>Transaction</p>
        </div>

      </div>
      <div class="row">
        <div class="col-md-13">
          <div class="tile">
            <!-- <h3 class="tile-title">Vehicle Info</h3> -->
            <div class="tile-body">
              <form id='form'>
            
              <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Choose Owners</label>
                                        <input class="form-control" list="owners_list" id="owner_id"  placeholder="Select Owner...">
                                            <datalist id="owners_list" required="true" >
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Vehicle Name </label>
                                        <input type="text" class="form-control" placeholder="Vehicle Name" id="type"
                                            name="type" required="true">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Chesis No</label>
                                        <input type="text" class="form-control" placeholder="Chesis No" id="Chesis_No"
                                            name="Chesis_No" required="true">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Model</label>
                                        <input type="number" class="form-control" placeholder="Manufactured Year" id="Manufactured_Year"
                                            name="Manufactured_Year" required="true">
                                    </div>
                                </div>
                            
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Color</label>
                                        <input type="text" class="form-control" placeholder="Color" id="Color"
                                            name="Color" required="true">
                                </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Cylinder No</label>
                                        <select name="Cylinder_No" id="Cylinder_No" class="form-control m-select" required="true">
                                        <option value="1">1</option>
                                        <option value="4">4</option>
                                        <option value="6">6</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Plate No </label>
                                        <input type="text" class="form-control" placeholder="Plate No" id="plate_no"
                                            name="plate_no" required="true">
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Date Register</label>
                                        <input class="form-control" type="date" id="register" name="register"
                                            value="<?php echo date('Y-m-d'); ?>" >
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                    <label>Details</label>
                                        <input type="text" class="form-control" placeholder="Details" id="details"
                                        name="details" required="true">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Select Suppliers</label>
                                        <select name="supplier[]" id="SupplierSelect" class="form-control" multiple="" >
                                       

                                        </select>
                                    </div>
                                </div>
                                
                                <div class="col-md-3">
                                    <div class="form-group">
                                    <label>Amount</label>
                                        <input type="number" step='0.1' class="form-control" placeholder="Amount" id="amount"
                                        name="amount" required="true">
                                    </div>
                                </div>
                                
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Select Witness</label>
                                        <select name="witness[]" id="witness" class="form-control " multiple="">
                                           
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                    <label>REF</label>
                                        <input type="text" class="form-control" placeholder="Ref" id="ref"
                                        name="ref" required="true">
                                    </div>
                                </div>
                            
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Date</label>
                                        <input class="form-control" type="date" id="date" name="date" value="<?php echo date('Y-m-d'); ?>">
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer" style="text-align: -webkit-right;">

                        <button class="btn btn-success" id="save" name="save" type="submit"><i
                                class="fa fa-save"></i>
                            Save
                            </button>
                        <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
                        <button type="button" onclick="document.location='vehicles.php'" class="btn btn-secondary"></i> Close
                        </div>
                        
            </button>
              </form>
            </div>
            
          </div>
        </div>
       
      </div>
    </main>



<?php
include("footer.php");
?>
<script src="../scripts/vehicles.js"></script>