/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React from 'react';
import {SafeAreaView, ScrollView, StatusBar, Text, View} from 'react-native';
import {helloWorld} from 'react-native-rust';
const App = () => {
  const [result, setResult] = React.useState();

  React.useEffect(() => {
    const doit = async () => {
      console.log('Generating Keypiar');
      setResult(await helloWorld());
    };
    doit();
  }, []);

  return (
    <SafeAreaView>
      <StatusBar />
      <ScrollView contentInsetAdjustmentBehavior="automatic">
        <View style={{backgroundColor: 'white'}}>
          <Text>Generation Result: {`${result}`}</Text>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};

export default App;
