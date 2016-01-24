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
    TouchableOpacity,
    TouchableHighlight,
    ListView
    } = React;

var RoverBridgeModule = requireNativeComponent('ImagePickerNativeMoudule_ios', null);

var mtext='12312312321';
var subscription = null;
var self;
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

    },

    componentDidMount(){
        self = this;
    },
    render: function () {
        return (
            <View style={[styles.testStyle,{flexDirection: 'column'}]}>

                <TouchableOpacity
                    onPresss={function(){
                            self._toMessageList(this.num);
                        }}>
                    }
                      <Text style={{width:100,height:50}}>
                          1231231123
                      </Text>
                </TouchableOpacity>
            </View>
            )
    },
    _clickedMe:function (){
        var kk = require('ImagePickerNativeMoudule_ios').RoverBridgeModule;

        kk.showImagePicker();
    }
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
    },
    testStyle:{
        flex:1,
        backgroundColor:'gray'
    },
    textStyle:{
        fontFamily:'Cochin',
        backgroundColor:'green',
        fontSize:20,
        color:'white',
        marginTop:30,
        marginLeft:50
    }
});


AppRegistry.registerComponent('testBridge', () => testBridge);
