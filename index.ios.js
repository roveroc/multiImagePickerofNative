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

//var RoverBridgeModule = requireNativeComponent('RoverBridgeModule', null);

var NativeAppEventEmitter = React.NativeAppEventEmitter;
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
        var ds = new ListView.DataSource({rowHasChanged: (r1, r2) => r1 !== r2});
        return {
            dataSource: ds.cloneWithRows(this._genRows({})),
        };
    },

    componentDidMount(){
        self = this;
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


            //<ListView style={{backgroundColor:'green',flex:1}}
            //    dataSource={this.state.dataSource}
            //    renderRow={this._renderRow}
            //    renderScrollComponent={props => <RecyclerViewBackedScrollView {...props} />}
            //    />

            <View style={[styles.testStyle,{flexDirection: 'column'}]}>

                <TouchableOpacity
                    onPress = {
                      ()=>{
                          this._clickedMe();
                      }
                    }
                    onLongPress = {"asdf"}


                      <Text style={[styles.textStyle,{width:100,height:50}]}>
                          1231231123
                      </Text>
                </TouchableOpacity>

                <Text ref='text' style={[styles.textStyle,{marginLeft:10,width:100,height:200,backgroundColor: this.state.textBackgroundColor}]}>
                    {mtext}
                </Text>

            </View>
            );



    },
    _clickedMe:function (){
        //console.log(this.refs['text']);
        //this.refs['text'].text='red';
        //mtext = '111';
        //console.log('clicked');
        //this.setState({textBackgroundColor: 'red'})
        //console.log(this.addNumber(1));
        //console.log(this.addNumber(4));
        //console.log(this.addNumber(10));
        //console.log(this.addNumber(2));
    },

    addNumber :function (var1)
    {
        switch(var1){
            case 1:
                console.log(1);
                break;
            case 2:
                console.log(2);
                break;
            default:
                console.log(10);
                break;
        }
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
