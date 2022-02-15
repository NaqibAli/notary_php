<?php
    include("header.php");
    include("sidebar.php");
?>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/print-js/1.6.0/print.min.css" integrity="sha512-zrPsLVYkdDha4rbMGgk9892aIBPeXti7W77FwOuOBV85bhRYi9Gh+gK+GWJzrUnaCiIEm7YfXOxW8rzYyTuI1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                    <div class='d-flex justify-content-between'>

                        <div>Ujeeddo: Sugitaan Mulkiyad Baabuur/Mooto</div>
                        <div> Date: 16/09/2021 </div>
                    </div>
                    <p>
                    Anigoo ah Markhaati 1: Mowliid Calas Cali, Soomaali ah, ina Naado Maxamed Xasan, 
                    ku dhashay Xamar, Sannadkii 1982-dii, Deggan Xamar Degmada Dharkenley, Tell: 0617707050, 
                    Lehna (Idcard-ka Warqadda ku dhegan) Marag 2: Maxamed Xuseen Xaashi, Soomaali ah, 
                    hooyadey tahay Faadumo Xirsi Canshuur, ku dhashay Matamaan, Sanadkii-1984-dii, 
                    degan Xamar Degmada Hilwa,lehna (Idcard-ka warqada ku dhegan) iyo Tell: (0613878999)  
                    waxaan halkaan si wadajir ah ugu caddaynaynaa in uu baabuurka noociisu yahay TOYOTA PROBOX, 
                    Chassis No:NCP55-0070915, Model/Sanadka la Sameeyay 2009, Color /Midabka SILVER, Cylinder 4, 
                    uu yahay mulkiyadda Mr. Calas Cali Jimcaale, Soomaali ah hooyadey tahay Ceeblo Dhinbil Dhore,
                    kuna Dhashay Dhusamareb, Sannadkii 1966-dii, Dagan Xamar Degmada Wadajir, Tell: 0615556988,
                    Lehna (Laysiinka Warqadda ku dhegan) kaasoo baabuurkaan ka soo iibsaday Dalka Imaaradka Carabta dukumintigiisiina halkaan ku lifaaqan yahay,
                    sidaas darteed anagoo ka caafimaad qabna maskaxda iyo jirkaba cid na qasabtayna aysan jirin qowl iyo ficilba,
                    ogna been abuurka denbigiisa aduun iyo aakhiraba, waxaan halkaan ku caddaynaynaa oo aan sugeynaa in baabuurka sare ku qoran uu yahay mulkiyadda Calas Cali Jimcaale, 
                    anagaa qaadeyna wixii ka yimaada mulkiyadda B/buurkaan waxaana ka nahay damiinu-maal haddi ay timaado sheegasho cidkale.
                    </p>
                    
                    <div>
                        <h6 class="text-center">Sugayaal</h6>
                        <ol>
                            <li>Cali Xasan Calasow (Tell: 0615880300)</li>
                            <li>Maxamed Calas Cali (Tell: 0612125586)</li>
                        </ol>
                    </div>
                    <h6 class="text-center">Xafiiska Nootaayo Banaadir</h6>
                    <h6 class="text-center">Saxiixa la Sugay</h6>



                    <h6>REF: B 190/98796/021 </h6>

                    <p>
                    Anigoo ah Dr. C/raxman Max’uud Cali leh Xafiiska Nootaayo Banaadir timocadde ee ku yaala Degmada Wadajir Agagaarka KM4 qaybt 2.aad Waxaan Halkaan ku Sugayaa in Saxiixa sare ku qoran uu yahay kii dhabta ahaa ee Markhaatiyaasha Sugay mulkiyadda baabuurka sare ku qoran oo kala ah, Mowliid Calas Cali & Maxamed Xuseen Xaashi, Waxayna ku saxiixeen Xafiiska dhexdiisa iyadoo aan cidina qasbin, waxaan ku qoray oo ka saxiixay diiwaanka guud ee nootaayadda.

                    </p>

                    <h6 class='text-center'>Xafiiska Nootaayo Banaadir</h6>
                    <p class='text-center'>Dr.C/raxmaan Maxamuud Cali (timacadde)</p>


                    By:Bashka
<div class='mt-4' style="border-top:2px solid black">
<h1 class="text-center"> Wadajir district, Mogadishu-Somalia +25261 9033333 /615598999, timocade114@gmail.com </h1>
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
    <script>
         function print(id) {
        newwin = window.open("report");
        var print_area = $(`#${id}`).html();
        var head=$("head").html()
        var style=`<style>
        *,body{
            font-family:"Times New Roman" !important;
            font-size:18px !important;
        }
        </style>`;
        newwin.document.write("<html>");
        newwin.document.write(head);
        newwin.document.write(style);
        newwin.document.write("<body>");
        newwin.document.write(print_area);
        newwin.document.write("</body></html>");
       setTimeout(() => {
            newwin.print();
            newwin.close();
       }, 500);
        
        // window.location = "report.php";
    }
    </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/print-js/1.6.0/print.min.js" integrity="sha512-16cHhHqb1CbkfAWbdF/jgyb/FDZ3SdQacXG8vaOauQrHhpklfptATwMFAc35Cd62CQVN40KDTYo9TIsQhDtMFg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>