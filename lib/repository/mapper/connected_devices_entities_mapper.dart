import 'package:flutter_cleanarchitecture/data/remote/apiservice/bean/blocked_device.dart';
import 'package:flutter_cleanarchitecture/data/remote/apiservice/bean/get_block_list.dart';
import 'package:flutter_cleanarchitecture/data/remote/apiservice/bean/get_client_list.dart';
import 'package:flutter_cleanarchitecture/data/remote/apiservice/bean/get_profile_list.dart';
import 'package:flutter_cleanarchitecture/entity/connected_device_entity.dart';
import 'package:flutter_cleanarchitecture/util/mapper.dart';

class ConnectedDeviceEntitiesMapper
    implements Mapper<CompositeGetClientListBean, List<ConnectedDeviceEntity>> {
  @override
  List<ConnectedDeviceEntity> map(CompositeGetClientListBean bean) {
    List<ConnectedDeviceEntity> connectedDevices = [];
    List<ConnectedDeviceEntity> blockDevices = [];
    List<ConnectedDeviceEntity> allDevices = [];

    // add online devices
    for (final client in bean.getClientList.client_list) {
      ConnectedDeviceEntity entity = mapEntityFromOnlineDevices(client, bean);
      connectedDevices.add(entity);
    }

    // add blocked devices
    for (final blockClient in bean.getBlockList.block_list) {
      ConnectedDeviceEntity entity = mapEntityFromBlockList(blockClient);
      blockDevices.add(entity);
    }

    allDevices.addAll(blockDevices);
    allDevices.addAll(connectedDevices);

    // get all profiles' devices and map to
    // ProfileDevice(index, deviceName, deviceMac, profileName)
    List<ProfileDevice> profileDevices =
        mapProfileDevices(bean.getProfileList.profile);

    // run through each of devices and update profile attribute when matched.
    for (final device in allDevices) {
      updateProfileOnceMatched(profileDevices, device);
    }
    return allDevices;
  }

  ConnectedDeviceEntity mapEntityFromOnlineDevices(
      Client client, CompositeGetClientListBean bean) {
    ConnectType connectType = mapConnectType(client.connect_type);
    Band band = mapOnlineBand(client.connect_type);
    bool isGuest = mapIsOnlineGuest(client.connect_type);
    bool isController = (bean.controllerIp == client.ip);
    ConnectedDeviceEntity entity = ConnectedDeviceEntity.onlineDevice(
        client.name,
        client.mac,
        client.ip,
        connectType,
        client.rssi,
        isController,
        isGuest,
        ParentalControlProfile.empty(),
        band);
    return entity;
  }

  ConnectedDeviceEntity mapEntityFromBlockList(BlockedDevice blockClient) {
    ConnectType connectType = mapConnectType(blockClient.connect_type);
    ConnectedDeviceEntity entity = ConnectedDeviceEntity.blockDevice(
        blockClient.name, blockClient.mac, connectType, Band.UNKNOWN);
    return entity;
  }

  List<ProfileDevice> mapProfileDevices(List<Profile> profiles) {
    List<ProfileDevice> profileDevices = [];
    for (int i = 0; i < profiles.length; i++) {
      final profile = profiles[i];
      String profileName = profile.name;
      int index = 0;
      for (final device in profile.device) {
        profileDevices
            .add(ProfileDevice(index, device.name, device.mac, profileName));
      }
    }
    return profileDevices;
  }

  void updateProfileOnceMatched(
      List<ProfileDevice> profileDevices, ConnectedDeviceEntity device) {
    for (final profileDevice in profileDevices) {
      if (device.mac == profileDevice.mac) {
        device.profile = ParentalControlProfile(
            profileDevice.profileName, profileDevice.profileIndex);
      }
    }
  }

  ConnectType mapConnectType(String connectType) {
    if (connectType == "eth") {
      return ConnectType.ETHERNET;
    } else if (connectType.contains("5G") ||
        connectType.contains("2G") ||
        connectType.contains("wifi")) {
      return ConnectType.WIFI;
    } else {
      return ConnectType.UNKNOWN;
    }
  }

  bool mapIsOnlineGuest(String connectType) {
    return connectType.contains("-1");
  }

  Band mapOnlineBand(String connectType) {
    if (connectType.contains("5G")) {
      return Band.WIFI_5G;
    } else if (connectType.contains("2G")) {
      return Band.WIFI_2_4G;
    } else {
      return Band.UNKNOWN;
    }
  }
}

class CompositeGetClientListBean {
  GetClientList getClientList;
  GetBlockList getBlockList;
  GetProfileList getProfileList;
  String controllerIp;

  CompositeGetClientListBean(this.getClientList, this.getBlockList,
      this.getProfileList, this.controllerIp);
}

class ProfileDevice {
  int profileIndex;
  String name;
  String mac;
  String profileName;

  ProfileDevice(this.profileIndex, this.name, this.mac, this.profileName);
}
