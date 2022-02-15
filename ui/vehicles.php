<?php
    include("header.php");
    include("sidebar.php");
?>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<main class="app-content">
      <div class="row">
        <div class="col-md-12">
        <div class="card">

        <div class="card-header border-bottom">
    <div class="row">
        <div class="col-md-6">
            <h5 class="card-title mb-0">
                VEHICLES LIST

            </h5>
        </div>

        <div class="col-md-6 text-right">
            <button type="button" onclick="document.location='beec.php'" class="btn btn-primary float-right  mb-1 mb-md-0">
                <i class=" fa fa-plus-circle"> </i> Enter Vehicles
            </button>

        </div>
    </div> </div>
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

    
            
    </main>
    
    <?php
    include("footer.php");
    ?>
 <script src="../scripts/get.js"></script>
