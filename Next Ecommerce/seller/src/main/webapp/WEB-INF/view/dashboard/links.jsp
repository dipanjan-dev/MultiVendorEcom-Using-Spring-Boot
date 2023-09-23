<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/select/1.7.0/css/select.bootstrap5.min.css">
<link href=".././dist/css/tabler.min.css" rel="stylesheet"/>
<link href=".././dist/css/tabler-flags.min.css" rel="stylesheet"/>
<link href=".././dist/css/tabler-payments.min.css" rel="stylesheet"/>
<link href=".././dist/css/tabler-vendors.min.css" rel="stylesheet"/>
<link href=".././asset/css/style.css" rel="stylesheet"/>
<style>
    div.dataTables_wrapper div.dataTables_length select{
        width: 100% !important;
    }
    table.dataTable>tbody>tr{
        border-bottom: 1px solid #e0e0e0;
    }
    tbody, td, tfoot, th, thead, tr{
        border-bottom: 1px solid #e0e0e0 !important;
    }
    #myTable{
        margin-top: 20px !important;
    }
    .dataTables_wrapper .dataTables_paginate .paginate_button:hover{
        background: transparent !important;
        border: 1px solid transparent;
    }
    .dataTables_wrapper .dataTables_paginate .paginate_button:active{
        background: transparent !important;
        border: 1px solid transparent;
        box-shadow: none !important;
    }
    .dataTables_wrapper .dataTables_paginate .paginate_button:focus-visible{
        border: 1px solid transparent;
        outline: none !important;
        box-shadow: none !important;
    }
    table.dataTable>tbody>tr.selected>* {
        box-shadow: inset 0 0 0 9999px #206bc4 !important;
        color: rgb(255, 255, 255) !important;
    }
    table.dataTable>tbody>tr.selected>* svg{
        stroke : #fff !important
    }
    table tr{
        cursor: pointer;
    }
    div.dt-buttons>.dt-button:focus:not(.disabled), div.dt-buttons>div.dt-button-split .dt-button:focus:not(.disabled){
        box-shadow: none !important;
        outline: none !important;
    }
    div.dt-buttons>.dt-button, div.dt-buttons>div.dt-button-split .dt-button{
        outline: none;
        background: #fff !important;
        padding: 8px 20px;
        font-weight: 500;
    }
    .dt-button-info{
        background: #fff !important;
        box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px !important;
        border-radius: 5px !important;
        border: 1px solid #d1d1d1 !important;
    }
</style>