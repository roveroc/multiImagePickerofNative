/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var React = require('react-native');

var Button = require('react-native-button');


var {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    requireNativeComponent,
    DeviceEventEmitter,
    PushNotificationIOS,
    NativeAppEventEmitter,
    } = React;

var RoverBridgeModule = requireNativeComponent('RoverBridgeModule', null);

var NativeAppEventEmitter = React.NativeAppEventEmitter;

var subscription = null;

//var MapView = require('./MapView');
var region = {
    latitude: 24.134844,
    longitude: 113.317290,
    latitudeDelta: 0.1,
    longitudeDelta: 0.1,
    imageUrl: 'https://www.google.com.hk/images/nav_logo242.png',
};

//var RoverNativeView= requireNativeComponent('MapNativeModoule_Rover', null);
var testBridge = React.createClass({
    getInitialState: function () {
        return {
            loaded: false,
            num: 0
        }
    },
    componentDidMount(){
        console.log("MainPage:componentDidMount()")

        //PushNotificationIOS.requestPermissions();

        DeviceEventEmitter.addListener(
            'PayNotification',
            function(obj) {
                console.log(obj);
            }
            //(obj) => console.log(obj)
        );




    },
    render: function () {
        return (

            <View style={{backgroundColor:'gray',flex:1,alignItems:'center',justifyContent:'center'}}>

                <Button
                    style={{fontSize: 20, color: 'green',marginTop:44}}
                    styleDisabled={{color: 'red'}}
                    onPress={this._handlePress}
                    >
                    Press Me!
                </Button>

            </View>);

        //<Text style={{color:'red'}}>{this.state.num}</Text>
        //<Button
        //    style={{fontSize: 20, color: 'green',marginTop:44}}
        //    styleDisabled={{color: 'red'}}
        //    onPress={this._handlePress}
        //    >
        //    Press Me!
        //</Button>

    },

    _handlePress(event) {

        var kk = require('NativeModules').RoverBridgeModule;

        kk.pay(region);

        //kk.addNumber(111,2,(error, events) => {
        //    if (error) {
        //        console.error(error);
        //    } else {
        //        console.log(events);
        //        this.setState({events: events});
        //    }
        //})

        console.log('Pressed!');
    },
});

var styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        margin: 50,
        backgroundColor: 'gray',
    },
    welcome: {
        fontSize: 50,
        textAlign: 'center',
        margin: 10,
    },
    instructions: {
        textAlign: 'center',
        color: '#333333',
        marginBottom: 5,
    }
});

//var ExampleComponent = React.createClass({123
//  render() {
//  return (
//      <Button
//         style={{fontSize: 20, color: 'green',marginTop:44}}
//         styleDisabled={{color: 'red'}}
//         onPress={this._handlePress}
//     >
//         Press Me!
//    </Button>
//
//
//);
//},
//
//_handlePress(event) {
//
//    var kk = require('NativeModules').RoverBridgeModule;
//
//    kk.addNumber(10,2,(error, events) => {
//        if (error) {
//            console.error(error);
//        } else {
//            console.log(events);
//            this.setState({events: events});
//        }
//    })
//
//
//
//  console.log('Pressed!');
//},
//});
//
//module.exports = ExampleComponent;


AppRegistry.registerComponent('testBridge', () => testBridge);
