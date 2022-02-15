<?php
    include("header.php");
    include("sidebar.php");
?>
<main class="app-content">
      <div class="row">
        <div class="col-md-12">
        <div class="card">

<div class="card-header border-bottom">
    <div class="row">
        <div class="col-md-6">
            <h5 class="card-title mb-0">
               Customer Of List

            </h5>
        </div>

        <div class="col-md-6 text-right">
            <button type="button" class="btn btn-primary float-right  mb-1 mb-md-0"
                data-toggle="modal" id="btn_modle" data-target="#model">
                <i class=" fa fa-plus-circle"> </i> Enter Customers
            </button>

        </div>
    </div>


      </div>
      <div class="card-body">


              <div class="table-responsive">
                  <table class="table table-striped" id="table">
                      <thead class="thead-dark">
                          <th>#</th>

                      </thead>
                      <tbody>

                      </tbody>
                  </table>
              </div>
        </div>
          </div>
        </div>
      </div>

      <div class="modal fade" id="model" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" style="max-width: 800px; width: 800px !important;" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="example-Modal3">Enter Customer</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                       
                    </div>
                    <form id="form" method="post">
                        <div class="modal-body">
                            <input type="hidden" id="id" name="id">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group overflow-hidden">
                                        <label>Name</label>
                                        <input type="text" class="form-control" placeholder="Customer Name" id="name"
                                            name="name" required="true">
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group overflow-hidden">
                                        <label>Mother Name </label>
                                        <input type="text" class="form-control" placeholder="Mother Name" id="mother"
                                            name="mother">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group overflow-hidden">
                                        <label>Place of Birth</label>
                                        <input type="text" class="form-control" placeholder="Place of Birth" id="place"
                                            name="place" >
                                    </div>
                                </div>
                                
                                <div class="col-md-4">
                                    <div class="form-group overflow-hidden">
                                        <label>Date of Birth</label>
                                        <input type="text" class="form-control" placeholder="Place of Birth" id="dob"
                                            name="dob" >
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group overflow-hidden">
                                        <label>Address</label>
                                        <input type="text" class="form-control" placeholder="Address" id="address"
                                            name="address">
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group overflow-hidden">
                                        <label>Identity Type</label>
                                        <select name="identity" id="identity" class="form-control m-select">
                                            <option value="Passport">Passport</option>
                                            <option value="ID Card">ID Card</option>
                                            <option value="Laysiin">Laysiin</option>
                                            <option value="Dhalasho iyo sugnan">Dhalasho iyo sugnan</option>
                                            <option value="Sawir">Sawir</option>
                                           
                                        </select>
                                    </div>
                                </div>
                           
                                <div class="col-md-4">
                                    <div class="form-group overflow-hidden">
                                        <label>Phone</label>
                                        <input type="number" class="form-control" placeholder="Phone Call" id="phone"
                                            name="phone" required="true">
                                    </div>
                                </div>

                            <div class="col-md-4">
                                    <div class="form-group overflow-hidden">
                                        <label>Date</label>
                                        <input class="form-control" type="date" id="date"
                                                name="date"
                                                value="<?php echo date('Y-m-d'); ?>">
                                    </div>
                                </div>

                            
                            </div>

                         

                            <div class="modal-footer" style="text-align: -webkit-right;">

                                <button class="btn btn-success" id="save" name="save" type="submit"><i
                                        class="fa fa-save"></i>
                                    Save</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                    </form>
                    </div>
                </div>
            </div>
    </main>
    <?php
    include("footer.php");
    ?>
   <script src="../scripts/custo.js"></script>