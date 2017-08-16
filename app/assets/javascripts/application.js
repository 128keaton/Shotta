// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(function () {
    Dropzone.autoDiscover = false;
    var mediaDropzone = new Dropzone("#upload");
    Dropzone.options.mediaDropzone = false;
    mediaDropzone.options.acceptedFiles = ".jpeg,.jpg,.png,.gif";
    mediaDropzone.on("complete", function (files) {
        var _this = this;
        if (_this.getUploadingFiles().length === 0 && _this.getQueuedFiles().length === 0) {
            setTimeout(function () {
                var acceptedFiles = _this.getAcceptedFiles();
                var rejectedFiles = _this.getRejectedFiles();

                for (var index = 0; index < acceptedFiles.length; index++) {
                    var file = acceptedFiles[index];
                    var response = JSON.parse(file.xhr.response);
                    appendContent(response.file_name.url, response.id);
                }

                if (acceptedFiles.length != 0) {
                    //alertify.success('Uploaded ' + acceptedFiles.length + ' files successfully.');
                }
                if (rejectedFiles.length != 0) {
                    //alertify.error('Error uploading ' + rejectedFiles.length + ' files. Only image files are accepted.');
                }

                _this.removeAllFiles();
            
            }, 2000);
        }
        location.reload();
    });

    mediaDropzone.on("successmultiple", function(files, response) {
        location.reload();
    });
});
$('#done').click(function () {
    location.reload();
});