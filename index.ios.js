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

var kk = require('NativeModules').ImagePickerNativeMoudule_ios;

var ActionSheet = requireNativeComponent('ImagePickerNativeMoudule_ios', null);

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
    componentDidMount(){
        self = this;
    },
    render: function () {
        return (
            <View style={{flex:1,backgroundColor:'gray',flexDirection: 'column'}}>

                <ActionSheet style = {{flex:1,backgroundColor:'white'}}>

                </ActionSheet>


            </View>


    //        <Text style={{width:100,height:50,backgroundColor:'red',marginTop:100,marginLeft:100}}>
    //1231231123
    //</Text>
    //
    //<TouchableOpacity onPress={function(){
    //                        self._clickedMe();
    //                    }}>
    //
    //    <Text style={{width:100,height:50,backgroundColor:'red'}}>
    //        1231231123
    //    </Text>
    //</TouchableOpacity>


            )
    },
    _clickedMe:function (){
        //kk.showImagePicker((error, events) => {
        //    if (error) {
        //        console.error(error);
        //    } else {
        //        console.log(events);
        //    }
        //})



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
