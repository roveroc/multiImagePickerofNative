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
var self;

var testBridge = React.createClass({
    componentDidMount(){
        self = this;
    },
    render: function () {
        return (
            <View style={{flex:1,backgroundColor:'gray',flexDirection: 'column'}}>

                <TouchableOpacity onPress={function(){
                            self._clickedMe();
                        }}>

                    <Text style={{marginLeft:100,marginTop:100,width:100,height:50,backgroundColor:'lightblue'}}>
                        选择图片
                    </Text>
                </TouchableOpacity>
            </View>
            )
    },
    _clickedMe:function (){
        kk.showImagePicker((obj) => {
            console.log(obj['photos']);
        })
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
