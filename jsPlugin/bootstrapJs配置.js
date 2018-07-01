$('#file-fr').fileinput({
                    theme: "fa",
                    language: 'zh',
                    required:true,
                    uploadUrl: '#',//异步上传的地址
                    showUpload:false,//底部的上传按钮显示
                    overwriteInitial:false, //是否覆盖预览图片 默认为true 这里设置为false
                    showRemove:false,
                    autoReplace:false,
                    showClose:false,
                    maxFileSize:'1090',//上传文件的最大大小
                    deleteUrl:'test',//删除文件的url
                    uploadExtraData:{},//上传的额外上传项
                    //预览图片的显示
                    initialPreview: [
                        "<img src='/images/desert.jpg' class='file-preview-image' alt='Desert' title='Desert'>",
                        "<img src='/images/jellyfish.jpg' class='file-preview-image' alt='Jelly Fish' title='Jelly Fish'>",
                    ],
                    initialPreviewConfig: [
                        {
                            caption: 'desert.jpg',
//                            width: '120px',
                            url: '/localhost/avatar/delete',//删除链接
                            key: 100,
                            extra: {id: 100}
                        },
                        {
                            caption: 'jellyfish.jpg',
//                            width: '120px',
                            url: '/localhost/avatar/delete',//删除链接
                            key: 101,
                            frameClass: 'my-custom-frame-css',
                            frameAttr: {
                                style: 'height:80px',
                                title: 'My Custom Title',
                            },
                            extra: function() {
                                //删除时要额外传递给后台的内容
                                return {id: $("#id").val()};
                            },
                        }
                    ],
                    //以下两个选项需要一起配置，配置自定义的按钮显示形式
                    layoutTemplates:{
                        actions: '<div class="file-actions">\n' +
                        '    <div class="file-footer-buttons">\n' +
                        '        {upload} {download} {delete} {zoom} {other} {default}' +
                        '    </div>\n' +
                        '    {drag}\n' +
                        '    <div class="file-upload-indicator" title="{indicatorTitle}">{indicator}</div>\n' +
                        '    <div class="clearfix"></div>\n' +
                        '</div>',
                    },
                    initialPreviewThumbTags:[
                        {'{default}': '<span class="btn btn-default btn-sm">设为主图</span>'},
                        {'{default}': '<span class="btn btn-success btn-sm">主图</span>'},
                    ],
                    maxFileCount:6,//最多10张图片
                    showCancel:false,//在ajax上传时候才会显示
                    allowedFileExtensions: ['jpg', 'png', 'gif','bmp','jpeg'],
                    //配置图片预览上面的各个按钮的显示情况 包括配置在previe上的图片
                    fileActionSettings:{
//                        showUpload:false,
//                        showRemove:false,
                    },
                });