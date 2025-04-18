<?php $__env->startSection('dynamic'); ?>
    <?php dd("lol"); ?>
    <div class="col-lg-4">
        <div class="side-bar">
            <!-- edit profile section -->
            <div class="identity-confirmation">
                <form>
                    <div class="row g-4">
                        <?php if(auth()->user()->two_fa): ?>
                            <div class="col-12">
                                <h4><?php echo app('translator')->get('Two Factor Authenticator'); ?></h4>
                            </div>
                            <div class="input-box form-group form-block">
                                <div class="input-group">
                                    <input type="text" value="<?php echo e($previousCode); ?>"
                                           class="form-control" id="referralURL"
                                           readonly>
                                    <div class="input-group-append">
                                            <span class="input-group-text copy-btn copytext" id="copyBoard"
                                                  onclick="copyFunction()">
                                                <i class="fa fa-copy"></i>
                                            </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mx-auto text-center">
                                <img class="" class="mx-auto" src="<?php echo e($previousQR); ?>">
                            </div>

                            <div class="form-group mx-auto text-center">
                                <a href="javascript:void(0)" class="btn-custom"
                                   data-bs-toggle="modal"
                                   data-bs-target="#disableModal"><?php echo app('translator')->get('Disable Two Factor Authenticator'); ?></a>
                            </div>
                        <?php else: ?>
                            <div class="col-12">
                                <h4><?php echo app('translator')->get('Two Factor Authenticator'); ?></h4>
                            </div>
                            <div class="input-box form-group ">
                                <div class="input-group ">
                                    <input type="text" value="<?php echo e($secret); ?>"
                                           class="form-control" id="referralURL"
                                           readonly>
                                    <div class="input-group-append">
                                                <span class="input-group-text copy-btn copytext" id="copyBoard"
                                                      onclick="copyFunction()">
                                                    <i class="fa fa-copy"></i>
                                                </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mx-auto text-center">
                                <img class="" class="mx-auto" src="<?php echo e($qrCodeUrl); ?>">
                            </div>

                            <div class="form-group mx-auto text-center">
                                <a href="javascript:void(0)" class="btn-custom"
                                   data-bs-toggle="modal"
                                   data-bs-target="#enableModal"><?php echo app('translator')->get('Enable Two Factor Authenticator'); ?></a>
                            </div>
                        <?php endif; ?>
                    </div>
                </form>
            </div>
            <div class="identity-confirmation">
                <div class="row g-4 mt-3">
                    <h6 class="text-uppercase"><?php echo app('translator')->get('Use Google Authenticator to Scan the QR code  or use the code'); ?></h6>
                    <p class="p-2"><?php echo app('translator')->get('Google Authenticator is a multifactor app for mobile devices. It generates timed codes used during the 2-step verification process. To use Google Authenticator, install the Google Authenticator application on your mobile device.'); ?></p>
                    <a class="btn-custom"
                       href="https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2&hl=en"
                       target="_blank"><?php echo app('translator')->get('DOWNLOAD APP'); ?></a>
                </div>
            </div>
        </div>
    </div>
    <div id="enableModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content form-block">
                <div class="modal-header">
                    <h5 class="modal-title"><?php echo app('translator')->get('Verify Your OTP'); ?></h5>
                    <button type="button" class="btn-close" data-dismiss="modal">&times</button>

                </div>
                <form action="<?php echo e(route('user.twoStepEnable')); ?>" method="POST">
                    <?php echo csrf_field(); ?>
                    <div class="modal-body">

                        <div class="input-box form-group">
                            <input type="hidden" name="key" value="<?php echo e($secret); ?>">
                            <input type="text" class="form-control" name="code"
                                   placeholder="<?php echo app('translator')->get('Enter Google Authenticator Code'); ?>">
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dark" data-bs-dismiss="modal"><?php echo app('translator')->get('Close'); ?></button>
                        <button type="submit" class="btn btn-success"><?php echo app('translator')->get('Verify'); ?></button>
                    </div>

                </form>
            </div>

        </div>
    </div>

    <!--Disable Modal -->
    <div id="disableModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content form-block">
                <div class="modal-header">
                    <h5 class="modal-title"><?php echo app('translator')->get('Verify Your OTP to Disable'); ?></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal">&times</button>
                </div>
                <form action="<?php echo e(route('user.twoStepDisable')); ?>" method="POST">
                    <?php echo csrf_field(); ?>
                    <div class="modal-body">
                        <div class="input-box form-group">
                            <input type="text" class="form-control" name="code"
                                   placeholder="<?php echo app('translator')->get('Enter Google Authenticator Code'); ?>">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dark" data-bs-dismiss="modal"><?php echo app('translator')->get('Close'); ?></button>
                        <button type="submit" class="btn btn-success"><?php echo app('translator')->get('Verify'); ?></button>
                    </div>
                </form>
            </div>

        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('script'); ?>
    <script>
        function copyFunction() {
            var copyText = document.getElementById("referralURL");
            copyText.select();
            copyText.setSelectionRange(0, 99999);
            /*For mobile devices*/
            document.execCommand("copy");
            Notiflix.Notify.Success(`Copied: ${copyText.value}`);
        }
    </script>
<?php $__env->stopPush(); ?>


<?php echo $__env->make($theme.'user.setting.index', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH E:\xamp\htdocs\p2p\project\resources\views/themes/peerToPeer/user/twoFA/index.blade.php ENDPATH**/ ?>