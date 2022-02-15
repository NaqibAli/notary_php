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

                        <div>Ujeeddo: Heshiis kala gadasho Baabuur</div>
                        <div> Date: 16/09/2021 </div>
                    </div>
                    <p>
                        Muqdisho maanta oo ay taariikhdu tahay 16/09/2021 Aniga oo ah Calas Cali Jimcaale,Soomaali ah,
                        hooyadey tahay Ceeblo Dhinbil Dhore,

                        ku dhashay Dhusamareb, Sanadkii-1966-dii, degan Xamar Degmada Wadajir,lehna (Laysiinka warqada
                        ku dhegan) iyo Tell: (0615556988)
                        isla markaasna ka caafimaad qaba wax allaale iyo wixii wax u dhimi kara maskaxda iyo jirka
                        bini’aadamka cid i qasabtayna aysan jirin qowl
                        iyo ficilba,waxaan cadeynayaa in aan iska gaday baabuur noociisu yahay TOYOTA ALLION, Chassis
                        No:ZZT245-0036499, Model yhy 2006,
                        Midabku yahay SILVER, Cylinder 4, Lehna taargo No:AI/6609, Lehna Buuga Cagaran ee
                        MilkiyadNo:013803,Somaaliya ee taariikhdeedu thy
                        21/12/2020,waxaan baabuurkaan ka gaday kuna wareejiyay Xasan Maxamud Cali, Somaali ah, hoyadiis
                        thy Muumino Maxamed Jodax, kuna
                        Dhashay Cadde,sannadkii 1982-dii degan Xamar Degmada Yaqshiid, Lehna (Passpordka halkaan ku
                        dhegan) iyo, Tell: (0615547065) waxan
                        uga gaday lacag dhan($5,100 (Shan kun & boqol oo dollarka Mareykanka ah) lacagtan oo dhamaanteed
                        gacanta la’iga wada saaray ayadoon
                        wax ka dhimaneyn.baabuurkani wuxuu ka madax banaan yahay rahan, deyn iyo sheegasho cid kale,
                        wixii mulkiyadiisa ku yimada oo duritaan
                        shirci ah ama sheegasho cid kale ah aniga oo ah iska gade Calas Cali Jimcaale, ayaa damaana
                        qaadaya magdhawgiisa, sida daraadeed waxaa
                        Mulkiyadda baabuurkaas ku wareegey Xasan Maxamud Cali,Anigoo ah Xasan Maxamud Cali, waxaan
                        cadeynayaa in aan raali ka ahay beeca
                        b/buurkaan lana wareegay, waxaana markhaatiyaal ka ahaa Beecaan raga hos ku
                        qoran:-...........................................................
                    </p>
                    <div class="d-flex justify-content-between">
                        <div>
                            <h6> Saxiixa iska gadaha </h6>
                            Calas Cali Jimcaale
                        </div>
                        <div class='text-left'>
                            <h6> Saxiixa gataha </h6>
                            <ol>
                                <li>Calas Cali Jimcaale</li>
                                <li>Calas Cali Jimcaale</li>
                            </ol>
                        </div>
                    </div>
                    <div>
                        <h6>Saxiixa Markhaatiyaasha</h6>
                        <ol>
                            <li>Cali Xasan Calasow (Tell: 0615880300)</li>
                            <li>Maxamed Calas Cali (Tell: 0612125586)</li>
                        </ol>
                    </div>
                    <h6 class="text-center">Xafiiska Nootaayo Banaadir</h6>
                    <h6 class="text-center">Saxiixa la Sugay</h6>



                    <h6>REF: B 190/98796/021 </h6>

                    <p>
                        Anigoo ah Xafiiska Nootaayo Banaadir Dr. C/raxman Max’uud Cali (timacadde) oo ku yaala Degmada
                        Wadajir Agagaarka KM4
                        Qeybta 2aad,Waxan Halkaan ku Sugayaa in Saxiixa sare ku qoran uu yahay kii dhabta ahaa ee iska
                        gadaha Calas Cali Jimcaale,
                        iyo Markhatiyasha Cali Xasan Calasow & Maxamed Calas Cali,Waxayna ku saxiixeen Xafiiska
                        dhexdiisa iyado aan cidina qasbin
                        qowl iyo ficilba,kadib markii ay iska akhriyeen kuna qanceen,waxaan ku qoray oo ka saxiixay
                        diiwaanka guud ee nootaayadda.....

                    </p>

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