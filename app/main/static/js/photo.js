        var t;
        var videoPlaying = false;
        var take = false;
        let v = document.getElementById('v');
        let canvas = document.getElementById('canvas');
        // {# 开启摄像头方法#}
        document.getElementById("start").addEventListener("click", function () {
            // {#显示摄像头控件，隐藏图片控件#}
            v.style.display = 'block';
            canvas.style.display = 'none';

            // 老的浏览器可能根本没有实现 mediaDevices，所以我们可以先设置一个空的对象
            if (navigator.mediaDevices === undefined) {
                navigator.mediaDevices = {};
            }
            if (navigator.mediaDevices.getUserMedia === undefined) {
                navigator.mediaDevices.getUserMedia = function (constraints) {
                    // 首先，如果有getUserMedia的话，就获得它
                    var getUserMedia = navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;

                    // 一些浏览器根本没实现它 - 那么就返回一个error到promise的reject来保持一个统一的接口
                    if (!getUserMedia) {
                        return Promise.reject(new Error('getUserMedia is not implemented in this browser'));
                    }

                    // 否则，为老的navigator.getUserMedia方法包裹一个Promise
                    return new Promise(function (resolve, reject) {
                        getUserMedia.call(navigator, constraints, resolve, reject);
                    });
                }
            }
            const constraints = {
                video: true,
                audio: false

            };
            let promise = navigator.mediaDevices.getUserMedia(constraints);
            promise.then(stream => {
                t = stream.getTracks()[0];
                // 旧的浏览器可能没有srcObject
                if ("srcObject" in v) {
                    v.srcObject = stream;
                } else {
                    // 防止再新的浏览器里使用它，应为它已经不再支持了
                    v.src = window.URL.createObjectURL(stream);
                }
                v.onloadedmetadata = function (e) {
                    v.play();
                    videoPlaying = true;
                };
            }).catch(err => {
                console.error(err.name + ": " + err.message);
            });

            // {#document.getElementById("stop").addEventListener("click", function () {#}
            // {#mediaStreamTrack && mediaStreamTrack.stop();#}
            // {#MediaStream.getTracks()[1] && MediaStream.getTracks()[1].remove();#}
            // {#    t.stop();#}
            // {#	隐藏vedio空间"v"#}
            // {##}
            // {##}
            // {# });#}


            $('#upload').click(function () {
                if (take) {
                    let data = canvas.toDataURL('image/png');
                    let flag = 0;

                    $.ajax({
                        url: '/upload',
                        cache: false,
                        type: 'post',
                        data: {
                            'data_url': data,
                        },
                        dataType: 'text',
                        success: function (data) {
                        console.log(data)
                            document.getElementById("detectinfo").value=data;
                            var arr=data.split("\n");
                             //length=6,检测到已注册用户
                            if (arr.length==6){
                                var arr_id=arr[1].split(":");
                                var arr_name=arr[2].split(":");
                                var arr_gender=arr[3].split(":");
                                var arr_age=arr[4].split(":");
                                var arr_number=arr[5].split(":");
                                document.getElementById("u_userid").value=arr_id[1];
                                var obj = document.getElementById("userid");
                                obj.innerText= arr_id[1];
                                document.getElementById("u_name").value=arr_name[1];
                                document.getElementById("u_sex").value=arr_gender[1];
                                document.getElementById("u_age").value=arr_age[1];
                                document.getElementById("u_number").value=arr_number[1];
                            }
                            else{
                                // length=4,新用户仅返回用户id
                                if(arr.length==3){
                                     document.getElementById("userid").value=(arr[1].split(":"))[1];
                                }
                                // length=1,4人脸检测失败
                                else{
                                    if(arr.length==1||arr.length==4){
                                        document.getElementById("u_userid").value="";
                                        var obj = document.getElementById("userid");
                                        obj.innerText= "0";
                                        document.getElementById("u_name").value="";
                                        document.getElementById("u_sex").value="";
                                        document.getElementById("u_age").value="";
                                        document.getElementById("u_number").value="";
                                    }
                                }
                            }
                        },
                        error: function (e) {
                        }
                    });
                }
            });
        });

        // {#调用摄像头同时设置拍照按钮方法#}
        document.getElementById('tp').addEventListener('click', function () {
            if (videoPlaying) {
                canvas.width = v.videoWidth;
                canvas.height = v.videoHeight;
                canvas.getContext('2d').drawImage(v, 0, 0);
                let data = canvas.toDataURL('image/webp');
                // {#document.getElementById('photo').setAttribute('src', data);#}

                // {#                显示图片控件，隐藏摄像头控件#}
                t.stop();
                videoPlaying = false;
                v.style.display = 'none';
                canvas.style.display = 'block';
                take = true;

            } else {
                alert("请打开摄像头");
            }
        }, false);