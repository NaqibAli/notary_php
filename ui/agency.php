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
                Agency of List

            </h5>
        </div>

        <div class="col-md-6 text-right">
            <button type="button" class="btn btn-primary float-right  mb-1 mb-md-0"
                data-toggle="modal" id="btn_modle" data-target="#model">
                <i class=" fa fa-plus-circle"> </i> Enter Agency
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
                        <h5 class="modal-title" id="example-Modal3">Enter Agency</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                       
                    </div>
                    <form id="form" method="post">
                        <div class="modal-body">



                        <input type="hidden" id="custo_id" name="custo_id">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group overflow-hidden">
                                        <label>Provider </label>
                                        <input type="text" class="form-control" placeholder="Provider" id="provider"
                                            name="provider" required="true">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group overflow-hidden">
                                        <label>Phone</label>
                                        <input type="number" class="form-control" placeholder="Phone" id="Phone"
                                            name="Phone" >
                                    </div>
                                </div>

                                
                            </div>
                            <div class="row">
                               <div class="col-md-6">
                                    <div class="form-group overflow-hidden">
                                        <label>Description</label>
                                        <input type="text" class="form-control" placeholder="Description" id="des"
                                            name="des" required="true">
                                    </div>
                                </div>

                               
                                <div class="col-md-6">
                                    <div class="form-group overflow-hidden">
                                        <label>Receiving</label>
                                        <input class="form-control" type="text" id="receive"
                                                name="receive" placeholder="Receiving" required="true">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                               <div class="col-md-4">
                                    <div class="form-group overflow-hidden">
                                        <label>Mobile</label>
                                        <input type="number" class="form-control" placeholder="Mobile" id="mobile"
                                            name="mobile" required="true">
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group overflow-hidden">
                                        <label>Ref</label>
                                        <input type="text" class="form-control" placeholder="Ref" id="ref"
                                            name="ref" required="true">
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
   <script src="../scripts/wakaalad.js"></script>