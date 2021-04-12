
function doLike(pid, uid) {
    console.log(pid + "," + uid)
    const d = {
        pid: pid,
        uid: uid,
        operation: 'like'
    }
    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            console.log(data)

        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data)
        }
    })
}

function doDislike(pid, uid) {
    console.log(pid + "," + uid)
    const d = {
        pid: pid,
        uid: uid,
        operation: 'dislike'
    }
    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            console.log(data)
            if (data.trim() == 'true') {
                let c = $("#like-counter").html();
                c--;
                $("#like-counter").html(c);
            }

        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data)
        }
    })
}

function deleteThisPost(pid) {
    console.log(pid)
    const d = {
        postid: pid
    }
    $.ajax({
        url: "DeleteServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            console.log("done")
            swal("Your post has been deleted")
                    .then((value) => {
                        window.location="my_posts.jsp";
                    });
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data)
        }
    })
}

