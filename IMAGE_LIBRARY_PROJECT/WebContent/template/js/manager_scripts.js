 // Khởi tạo modal một lần duy nhất
  var modal = new bootstrap.Modal(document.getElementById('addForm'));

  function handleClick(event, element) {
    event.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ <a>

    var target = element.getAttribute('data-bs-target');

    // Đảm bảo không có modal nào khác đang mở
    var openModal = document.querySelector('.modal.show');
    if (openModal) {
      var openModalInstance = bootstrap.Modal.getInstance(openModal);
      openModalInstance.hide();
    }
  }

  // Đảm bảo modal đóng lại mà không gặp lỗi
  document.getElementById('addForm').addEventListener('hidden.bs.modal', function () {
    // Thực hiện các hành động cần thiết khi modal đóng lại nếu cần
    console.log('Modal has been closed');
  });
