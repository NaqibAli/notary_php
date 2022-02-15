<?php
    include("header.php");
    include("sidebar.php");
    ?>


<main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="#"></i> Payment Reports</h1>
          <!-- <p>Sample forms</p> -->
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">Forms</li>
          <!-- <li class="breadcrumb-item"><a href="#">Sample Forms</a></li> -->
        </ul>
      </div>
      
        <div class="row">
          <div class="card-body">

                <form action="" method="POST" id="frm_rpt_vehicles">
                <div class=" form-group">
                  <div class=" form-row">
                      <div class=" col-4">
                          <label for="lectures_id">Date Type</label>
                          <select name="date_type" class=" form-control" id="date_type">
                              <option value="0">Choose Date Type</option>
                              <option value="All">All</option>
                              <option value="custom">Custom</option>

                          </select>
                      </div>
                      <div class=" col-4">
                          <label for="from">From</label>
                          <input type="date" id="from" name="from" class=" form-control" value="<?php echo date('Y-m-d'); ?>">
                      </div>
                      <div class=" col-4">
                          <label for="to">To</label>
                          <input type="date" id="to" name="to" class=" form-control" value="<?php echo date('Y-m-d'); ?>">
                          </div>
                      </div>
                    </div>
                    <div class=" text-center mt-5">
                        <div class=" form-group">
                            <button type="submit" id="submit" name="submit" class=" btn btn-primary">Generate</button>
                        </div>
                    </div>

                  </form>
                  <div id="report_area">
                      <div style="text-align: center;">
                  <!-- <img width="120px" height="120px" src="../assets/img/avatars/Asset 1.png"
                      alt="Voucher Image"> -->
                  <h1 class="card-title mb-0" style="font-weight: bolder;">
                      <br>
                      Payments Report
                  </h1>
                    </div>
                    <br>
                <div class="table-responsive">
                  <div class="table table-striped">
                  <table id="tbl_rpt_vehicle" style="width: 100%;" cellspacing="0" cellpading="5px" border="1">
                      <thead class="thead-dark">
                          <tr>
                              <th>ID</th>
                              <th>Name</th>
                              <th>Amount</th>
                              <th>Discount</th>
                              <th>Net Amount</th>
                              <th>Date</th>
                          </tr>
                      </thead>
                      <tbody>

                      </tbody>

                  </table>
                  
              </div>
          </div>
          <div class=" card-footer">
                        <br>
                        <hr>

                        <div class=" form-group">
                            <div class=" row d-flex justify-content-center">
                                <div class=" col-2">
                                    <button type="button" id="print" name="print" class=" btn btn-dark btn-block">Print</button>
                                </div>
                                <div class=" col-2">
                                    <button type="button" id="Excell" name="Excell" class=" btn btn-danger btn-block">Export</button>
                                </div>
                            </div>
                        </div>

                    </div>

          </div>
      
    

            
          </div>
        </div>
      </div>
      
    </main>

    <?php
        include("footer.php");
    ?>
<script src="../scripts/rpt_payment.js"></script>