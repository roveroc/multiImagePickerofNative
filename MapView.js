/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var React = require('react-native');
var { requireNativeComponent,StyleSheet,View } = React;

var RoverNativeView= requireNativeComponent('MapNativeModoule_Rover', null);

class MapView extends React.Component {

    render() {
        //return <RoverNativeView {...this.props }/>;
        reuturn(<View></View>);
    }
}

MapView.propTypes = {

    onRegionChange: React.PropTypes.func,

    scrollEnabled: React.PropTypes.bool,
    setAnnomation: React.PropTypes.shape({
        /**
         * Coordinates for the center of the map.
         */
        latitude: React.PropTypes.number.isRequired,
        longitude: React.PropTypes.number.isRequired,

        /**
         * Distance between the minimum and the maximum latitude/longitude
         * to be displayed.
         */
        latitudeDelta: React.PropTypes.number.isRequired,
        longitudeDelta: React.PropTypes.number.isRequired,
    }),
};

module.exports = MapView;
