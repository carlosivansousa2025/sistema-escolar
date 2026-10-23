<!DOCTYPE html>
<html lang="en">

<head>
     <x-header/>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper" style="min-height: 100vh;">
       <x-side-bar />
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column" style="flex: 1;">
            <!-- Main Content -->
            <div id="content" class="flex-grow-1">
                <x-nav-bar />
                {{ $slot }}
            </div>
            <!-- End of Main Content -->
        <x-footer />
       </div>
       <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
     <x-modal />
    <x-script />
</body>
</html>