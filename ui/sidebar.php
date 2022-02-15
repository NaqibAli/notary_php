<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header("location: index.php");
} 
?>
 <!-- Sidebar menu-->
  <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="../images/bashka.jpg" alt="User Image" width="40%" height="40%" alt="User Image">
        <div>
          <p class="app-sidebar__user-name">Banadir</p>
          <p class="app-sidebar__user-designation">Public Notary</p>
        </div>
      </div>
      <ul class="app-menu">
        <li><a class="app-menu__item active" href="Dashboard.php"><i class="app-menu__icon fa fa-qrcode"></i><span class="app-menu__label">Dashboard</span></a></li>
        <!-- Owners -->
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-user"></i><span class="app-menu__label">Transaction One</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="owner.php"><i class="icon fa fa-circle-o"></i> Owners</a></li>
            <li><a class="treeview-item" href="vehicles.php"><i class="icon fa fa-circle-o"></i> Vehicles</a></li>
            <li><a class="treeview-item" href="customer.php"><i class="icon fa fa-circle-o"></i> Customers</a></li>
            <li><a class="treeview-item" href="witnes.php"><i class="icon fa fa-circle-o"></i> Witness</a></li>
          </ul>
        </li>
        <!-- ///////// -->
         
        <!-- agency -->
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-user"></i><span class="app-menu__label">Agency</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="agency.php"><i class="icon fa fa-circle-o"></i> Agency</a></li>
            
          </ul>
        </li>
        <!-- ///////// -->
        <!-- personal -->
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-address-card"></i><span class="app-menu__label">Personal</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="personal.php"><i class="icon fa fa-circle-o"></i> Personal</a></li>
          </ul>
        </li>
        <!-- ///////// -->
        <!-- document -->
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-envelope"></i><span class="app-menu__label">Documents</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="document.php"><i class="icon far fa-circle-o"></i> Documents</a></li>
           
          </ul>
        </li>

        <!-- ///////// -->
        <!-- payment -->

        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fas fa-dollar-sign"></i><span class="app-menu__label">Transaction</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="income.php"><i class="icon far fa-circle-o"></i> Daily Income</a></li>
            <li><a class="treeview-item" href="Expense.php"><i class="icon far fa-circle-o"></i> Daily Expense</a></li>
           
          </ul>
        </li>
         <!-- ///////// -->
        <!-- print -->

        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fas fa-print"></i><span class="app-menu__label">Print</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="print.php"><i class="icon far fa-circle-o"></i> Beec</a></li>
            <li><a class="treeview-item" href="print2.php"><i class="icon far fa-circle-o"></i> Sugnan</a></li>
          </ul>
        </li>
        <!-- ///////// -->
        <!-- reports -->
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-list"></i><span class="app-menu__label">Reports</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="rpt_payment.php"><i class="icon far fa-circle-o"></i> Payment Report</a></li>
           
          </ul>
        </li>
        
      </ul>
    </aside>