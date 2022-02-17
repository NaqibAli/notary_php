<?php
    include("header.php");
    include("sidebar.php");
?>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/print-js/1.6.0/print.min.css"
    integrity="sha512-zrPsLVYkdDha4rbMGgk9892aIBPeXti7W77FwOuOBV85bhRYi9Gh+gK+GWJzrUnaCiIEm7YfXOxW8rzYyTuI1A=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
ol,ul{
    list-style-type: none !important;
}
.border_dashed{
    border-bottom: 1px dashed #1d1c1c !important;
    margin-top:15px;
}
    </style>
<main class="app-content">
    <div class="row">
        <div class="col-md-12">
            <div class="card">

                <div class="card-body">
                    <div id="divtoprint" class='bg-orange'>


                        <div style="text-center">
                            <img src="../images/bashka.png" width="100%" />
                            <hr>
                        </div>
                        <div id="documentBody">

                        </div>
                        <h6 class='text-center'>Xafiiska Nootaayo Banaadir</h6>
                        <p class='text-center'>Dr.C/raxmaan Maxamuud Cali (timacadde)</p>
                        By:Bashka
                        <div class='mt-4' style="border-top:2px solid black">
                            <p>Wadajir district</p>
                        </div>

                    </div>

                    <button class='btn btn-primary' onclick="print('divtoprint')">Print</button>
                </div>
            </div>
        </div>
    </div>




</main>
<?php
    include("footer.php");
    ?>

<script src="https://cdnjs.cloudflare.com/ajax/libs/print-js/1.6.0/print.min.js"
    integrity="sha512-16cHhHqb1CbkfAWbdF/jgyb/FDZ3SdQacXG8vaOauQrHhpklfptATwMFAc35Cd62CQVN40KDTYo9TIsQhDtMFg=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="../scripts/print_doc.js"></script>

<?php 

if (isset($_GET['vehicle_id']) and $_GET['vehicle_id'] != '') {
  ?>
<script>
read_beec_info(<?php echo $_GET['vehicle_id'] ?>);
</script>
<?php
} 
?>