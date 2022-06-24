class CryptoModel {
  var status;
  List<Data>? data;

  CryptoModel({this.status, this.data});

  CryptoModel.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Status {
  var elapsed;
  var timestamp;

  Status({this.elapsed, this.timestamp});

  Status.fromJson(Map<String, dynamic> json) {
    elapsed = json['elapsed'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['elapsed'] = this.elapsed;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Data {
  var id;
  var slug;
  var symbol;
  var name;
  Metrics? metrics;

  Data({this.id, this.slug, this.symbol, this.name, this.metrics});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    symbol = json['symbol'];
    name = json['name'];
    metrics =
    json['metrics'] != null ? new Metrics.fromJson(json['metrics']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    if (this.metrics != null) {
      data['metrics'] = this.metrics!.toJson();
    }
    return data;
  }
}

class Metrics {
  MarketData? marketData;

  Metrics({this.marketData});

  Metrics.fromJson(Map<String, dynamic> json) {
    marketData = json['market_data'] != null
        ? new MarketData.fromJson(json['market_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.marketData != null) {
      data['market_data'] = this.marketData!.toJson();
    }
    return data;
  }
}

class MarketData {
  var priceUsd;
  var priceBtc;
  var priceEth;
  var volumeLast24Hours;
  var realVolumeLast24Hours;
  var volumeLast24HoursOverstatementMultiple;
  var percentChangeUsdLast1Hour;
  var percentChangeBtcLast1Hour;
  var percentChangeEthLast1Hour;
  var percentChangeUsdLast24Hours;
  var percentChangeBtcLast24Hours;
  var percentChangeEthLast24Hours;
  OhlcvLast1Hour? ohlcvLast1Hour;
  OhlcvLast1Hour? ohlcvLast24Hour;
  String? lastTradeAt;

  MarketData(
      {this.priceUsd,
        this.priceBtc,
        this.priceEth,
        this.volumeLast24Hours,
        this.realVolumeLast24Hours,
        this.volumeLast24HoursOverstatementMultiple,
        this.percentChangeUsdLast1Hour,
        this.percentChangeBtcLast1Hour,
        this.percentChangeEthLast1Hour,
        this.percentChangeUsdLast24Hours,
        this.percentChangeBtcLast24Hours,
        this.percentChangeEthLast24Hours,
        this.ohlcvLast1Hour,
        this.ohlcvLast24Hour,
        this.lastTradeAt});

  MarketData.fromJson(Map<String, dynamic> json) {
    priceUsd = json['price_usd'];
    priceBtc = json['price_btc'];
    priceEth = json['price_eth'];
    volumeLast24Hours = json['volume_last_24_hours'];
    realVolumeLast24Hours = json['real_volume_last_24_hours'];
    volumeLast24HoursOverstatementMultiple =
    json['volume_last_24_hours_overstatement_multiple'];
    percentChangeUsdLast1Hour = json['percent_change_usd_last_1_hour'];
    percentChangeBtcLast1Hour = json['percent_change_btc_last_1_hour'];
    percentChangeEthLast1Hour = json['percent_change_eth_last_1_hour'];
    percentChangeUsdLast24Hours = json['percent_change_usd_last_24_hours'];
    percentChangeBtcLast24Hours = json['percent_change_btc_last_24_hours'];
    percentChangeEthLast24Hours = json['percent_change_eth_last_24_hours'];
    ohlcvLast1Hour = json['ohlcv_last_1_hour'] != null
        ? new OhlcvLast1Hour.fromJson(json['ohlcv_last_1_hour'])
        : null;
    ohlcvLast24Hour = json['ohlcv_last_24_hour'] != null
        ? new OhlcvLast1Hour.fromJson(json['ohlcv_last_24_hour'])
        : null;
    lastTradeAt = json['last_trade_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price_usd'] = this.priceUsd;
    data['price_btc'] = this.priceBtc;
    data['price_eth'] = this.priceEth;
    data['volume_last_24_hours'] = this.volumeLast24Hours;
    data['real_volume_last_24_hours'] = this.realVolumeLast24Hours;
    data['volume_last_24_hours_overstatement_multiple'] =
        this.volumeLast24HoursOverstatementMultiple;
    data['percent_change_usd_last_1_hour'] = this.percentChangeUsdLast1Hour;
    data['percent_change_btc_last_1_hour'] = this.percentChangeBtcLast1Hour;
    data['percent_change_eth_last_1_hour'] = this.percentChangeEthLast1Hour;
    data['percent_change_usd_last_24_hours'] = this.percentChangeUsdLast24Hours;
    data['percent_change_btc_last_24_hours'] = this.percentChangeBtcLast24Hours;
    data['percent_change_eth_last_24_hours'] = this.percentChangeEthLast24Hours;
    if (this.ohlcvLast1Hour != null) {
      data['ohlcv_last_1_hour'] = this.ohlcvLast1Hour!.toJson();
    }
    if (this.ohlcvLast24Hour != null) {
      data['ohlcv_last_24_hour'] = this.ohlcvLast24Hour!.toJson();
    }
    data['last_trade_at'] = this.lastTradeAt;
    return data;
  }
}

class OhlcvLast1Hour {
  var open;
  var high;
  var low;
  var close;
  var volume;

  OhlcvLast1Hour({this.open, this.high, this.low, this.close, this.volume});

  OhlcvLast1Hour.fromJson(Map<String, dynamic> json) {
    open = json['open'];
    high = json['high'];
    low = json['low'];
    close = json['close'];
    volume = json['volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['open'] = this.open;
    data['high'] = this.high;
    data['low'] = this.low;
    data['close'] = this.close;
    data['volume'] = this.volume;
    return data;
  }
}