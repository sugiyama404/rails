// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
$(function() {
  $(".checkbox").on("click", function() {
    if ($(this).is(".checkboxkiller")) {
    } else {
      $(".checkbox").prop("checked", false); //  全部のチェックを外す
      $(this).prop("checked", true); //  押したやつだけチェックつける
    }
  });
});

$(function() {
  //セレクトボックスが切り替わったら発動
  $(
    "#reserved_reservedday_1i,#reserved_reservedday_2i,#reserved_reservedday_3i"
  ).change(function() {
    try {
      var today = new Date();

      var selectdays2 = new Date(
        Number($("#reserved_reservedday_1i").val()),
        Number($("#reserved_reservedday_2i").val()) - 1,
        Number($("#reserved_reservedday_3i").val()),
        00,
        00
      );

      function lowerThanDateOnly(date1, date2) {
        var year1 = date1.getFullYear();
        var month1 = date1.getMonth() + 1;
        var day1 = date1.getDate();

        var year2 = date2.getFullYear();
        var month2 = date2.getMonth() + 1;
        var day2 = date2.getDate();

        if (year1 == year2) {
          if (month1 == month2) {
            return day1 < day2;
          } else {
            return month1 < month2;
          }
        } else {
          return year1 < year2;
        }
      }

      if (lowerThanDateOnly(selectdays2, today)) {
        $(".alertbefore").after(
          "<div class='alert alert-danger text-center' role='alert'>今日より前の日付には予約できません。</div>"
        );
        return false;
      }

      var selectdays =
        "" +
        $("#reserved_reservedday_1i").val() +
        "-" +
        $("#reserved_reservedday_2i").val() +
        "-" +
        $("#reserved_reservedday_3i").val() +
        "";
      window.location.href = "/users/reserved/" + selectdays + "";
    } catch {
      alert(e);
    }
  });
});

$(function() {
  $(".checkboxkiller").click(function() {
    return false;
  });
});

$(function() {
  //バリデーション
  $("input.require").on("blur", function() {
    let error;
    let value = $(this).val();
    if (value == "") {
      error = true;
    } else if (!value.match(/[0-9a-zA-Z]/)) {
      error = true;
    }

    if (error) {
      //エラー時の処理
      $(this).addClass("is-invalid");
    } else {
      if ($(this).hasClass("is-invalid")) {
        $(this).removeClass("is-invalid");
      }
    }
  });
});

$("#form_id").submit(function() {
  //
  // バリデーションチェックや、データの加工を行う。
  //

  let error;
  let errormail;
  let errorpassword;
  let value = $("#login_mail").val();
  if (value == "") {
    error = true;
    errormail = true;
  } else if (!value.match(/[0-9a-zA-Z]/)) {
    error = true;
    errormail = true;
  }

  let value2 = $("#login_password").val();
  if (value2 == "") {
    error = true;
    errorpassword = true;
  } else if (!value2.match(/[0-9a-zA-Z]/)) {
    error = true;
    errorpassword = true;
  }

  if (error) {
    //エラー時の処理
    //バリデーションチェックの結果submitしない場合、return falseすることでsubmitを中止することができる。
    return false;
  }
});

$("#form_id2").submit(function() {
  //
  // バリデーションチェックや、データの加工を行う。
  //

  let error;
  let value = $("#guest_mail").val();
  if (value == "") {
    error = true;
  } else if (!value.match(/[0-9a-zA-Z]/)) {
    error = true;
  }

  let value2 = $("#guest_password").val();
  if (value2 == "") {
    error = true;
  } else if (!value2.match(/[0-9a-zA-Z]/)) {
    error = true;
  }

  let value3 = $("#guest_name").val();
  if (value3 == "") {
    error = true;
  }

  if (error) {
    //エラー時の処理
    //バリデーションチェックの結果submitしない場合、return falseすることでsubmitを中止することができる。
    return false;
  }
});
