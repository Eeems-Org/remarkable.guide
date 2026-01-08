====
Wifi
====

.. fixme::

`Old wiki article <https://web.archive.org/web/20230129155419/https://remarkablewiki.com/tips/wifi>`_

Xochitl Network Settings
------------------------

.. code-block:: c++

  QSettings settings("/home/root/.config/remarkable/xochitl.conf");
  settings.sync();
  settings.beginGroup("wifinetworks");
  QMap<QString, QVariantMap> wifinetworks;
  for(const QString& key : settings.allKeys()){
      QVariantMap network = settings.value(key).toMap();
      wifinetworks[key] = network;
  }
  settings.endGroup();

DBus communication with wpa_supplicant
--------------------------------------

https://w1.fi/wpa_supplicant/devel/dbus.html
