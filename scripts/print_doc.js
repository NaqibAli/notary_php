    function read_beec_info(id) {
        var data = {
            "action": "read_all",
            "id": id,
            "procedure": "vehicles_print_info_sp",
        };
    
        $.ajax({
            method: "POST",
            url: "../apis/dynamic.php",
            data: data,
            dataType: "JSON",
            async: false,
            success: function(data) {
                var status = data.status;
                var [message] = data.message;
                    let htmlBody=``;
                if (status == true) {
               console.log(message)
               htmlBody +=`
               <div class='d-flex justify-content-between'>

               <div>Ujeeddo: Heshiis kala gadasho Baabuur</div>
               <div>Date: <b>${message['Registration_date']}</b> </div>
           </div>
           <p>
               Muqdisho maanta oo ay taariikhdu tahay <b>${message['Registration_date']}</b> Aniga oo ah <b>${message['Owner']}</b>,Soomaali
               ah,
               hooyadey tahay <b>${message['owner_mother']}</b>,

               ku dhashay <b>${message['owner_pob']}</b>, Sanadkii-<b>${message['owner_dob']}</b>, degan Xamar Degmada <b>${message['owner_address']}</b>,lehna (<b>${message['owner_identity']}</b>
               warqada
               ku dhegan) iyo Tell: (<b>${message['owner_phone']}</b>)
               isla markaasna ka caafimaad qaba wax allaale iyo wixii wax u dhimi kara maskaxda iyo jirka
               bini’aadamka cid i qasabtayna aysan jirin qowl
               iyo ficilba,waxaan cadeynayaa in aan iska gaday baabuur noociisu yahay <b>${message['Type']}</b>,
               Chassis
               No:<b>${message['Chassis_no']}</b>, Model yahy <b>${message['Model']}</b>,
               Midabku yahay <b>${message['Color']}</b>, Cylinder <b>${message['Cylinder']}</b>, Lehna taargo No:<b>${message['Plate_no']}</b>, Lehna Buuga Cagaran ee
               MilkiyadNo:013803,Somaaliya ee taariikhdeedu thy
               21/12/2020,waxaan baabuurkaan ka gaday kuna wareejiyay <b>${message['Supplier']}</b>, Somaali ah,
               hoyadiis
               tahy <b>${message['supplier_1mother']}</b>, kuna
               Dhashay <b>${message['supplier_1place']}</b>,sannadkii <b>${message['supplier_1dob']}</b> degan Xamar Degmada <b>${message['supplier_1address']}</b>, Lehna (<b>${message['supplier_1identity']}</b> halkaan ku
               dhegan) iyo, Tell: (<b>${message['supplier_1phone']}</b>) waxan
               uga gaday lacag dhan($<b>${message['Amount']}</b> (Shan kun & boqol oo dollarka Mareykanka ah) lacagtan oo
               dhamaanteed
               gacanta la’iga wada saaray ayadoon
               wax ka dhimaneyn.baabuurkani wuxuu ka madax banaan yahay rahan, deyn iyo sheegasho cid kale,
               wixii mulkiyadiisa ku yimada oo duritaan
               shirci ah ama sheegasho cid kale ah aniga oo ah iska gade <b>${message['Owner']}</b>, ayaa damaana
               qaadaya magdhawgiisa, sida daraadeed waxaa
               Mulkiyadda baabuurkaas ku wareegey <b>${message['Supplier']}</b>,Anigoo ah <b>${message['Supplier']}</b>, waxaan
               cadeynayaa in aan raali ka ahay beeca
               b/buurkaan lana wareegay, waxaana markhaatiyaal ka ahaa Beecaan raga hos ku
               qoran:-...........................................................
           </p>
           <div class="d-flex justify-content-between">
               <div>
                   <h6> Saxiixa iska gadaha </h6>
                    <div class='ml-3'>
                   <p><b>${message['Owner']}</b></p>
                   <p class='border_dashed'></p>
                   </div>
                   
               </div>
               <div class='text-left mr-4'>
                   <h6 class='text-center'> Saxiixa gataha </h6>
                   <div class=''>
                       <p><b>${message['Supplier']}</b></p>
                       <p class='border_dashed'></p>
                       ${message['supplier_2phone']?`<p><b>${message['Supplier2']}</b></p>
                       <p class='border_dashed'></p>`:''}
                       </div>
                       </div>
           </div>
           <div class=''>
               <h6>Saxiixa Markhaatiyaasha</h6>
               <div>
                   <p><b>${message['Witness']}</b> (Tell: <b>${message['witness1phone']}</b>) <span class="ml-2 border_dashed d-inline-block" style="width:200px;"></span></p>
                   ${message['witness2phone']?`<p><b>${message['Witness2']}</b> (Tell: <b>${message['witness2phone']}</b>) <span class="ml-2 border_dashed d-inline-block" style="width:200px;"></span></p>`:""} 
               </div>
           </div>
           <h6 class="text-center">Xafiiska Nootaayo Banaadir</h6>
           <h6 class="text-center">Saxiixa la Sugay</h6>



           <h6>REF: <b>${message['Ref']}</b> </h6>

           <p>
               Anigoo ah Xafiiska Nootaayo Banaadir Dr. C/raxman Max’uud Cali (timacadde) oo ku yaala
               Degmada
               Wadajir Agagaarka KM4
               Qeybta 2aad,Waxan Halkaan ku Sugayaa in Saxiixa sare ku qoran uu yahay kii dhabta ahaa ee
               iska
               gadaha <b>${message['Owner']}</b>,
               iyo Markhatiyasha <b>${message['Witness']}</b> & <b>${message['Witness2']}</b>,Waxayna ku saxiixeen Xafiiska
               dhexdiisa iyado aan cidina qasbin
               qowl iyo ficilba,kadib markii ay iska akhriyeen kuna qanceen,waxaan ku qoray oo ka saxiixay
               diiwaanka guud ee nootaayadda.....

           </p>
               `
                }else{
                    swal({
                        type:'error',
                        icon:"error",
                        title:"Data Not Found"
                    })
                }
                $("#documentBody").html(htmlBody);
    
            },
            error: function(data) {
    
            }
        });
    
    }



    function print(id) {
        newwin = window.open("report");
        var print_area = $(`#${id}`).html();
        var head=$("head").html()
        var style=`<style>
        *,body{
            font-family:"Times New Roman" !important;
            font-size:18px !important;
        }
        .border_dashed{
            border-bottom: 1px dashed #1d1c1c !important;
            margin-top:15px;
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
