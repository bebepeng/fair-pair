window.NotificationPermissions = {
  askForPermission: function () {
    if (Notification && Notification.permission !== "granted") {
      Notification.requestPermission(function (status) {
        if (Notification.permission !== status) {
          Notification.permission = status;
        }
      });
    }
  },

  hasPermission: (Notification && Notification.permission === "granted")
};