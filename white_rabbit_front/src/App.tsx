import React, { Dispatch } from 'react';
import { IRootState } from './store';
import { connect } from 'react-redux';
import { DemoActions } from './store/demo/types';
import * as actions from './store/demo/actions';
import * as asyncactions from './store/demo/async-actions';

interface IState {
  inputText: string;
}

class App extends React.Component<ReduxType> {
  public state: IState = { inputText: '' };
  public onInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    this.setState({ inputText: e.target.value });
  };
  public onAddClick = () => {
    this.props.addItem(this.state.inputText);
    this.setState({ inputText: '' });
  };
  public render() {
    const { list, loading } = this.props;

    return (
      <div style={{ margin: '20px' }}>
        <input value={this.state.inputText} onChange={this.onInputChange} />
        <button onClick={this.onAddClick}>Add</button>
        {loading && <div>Loading...</div>}
        <ul>
          {list.map((l) => (
            <li key={l}>{l}</li>
          ))}
        </ul>
      </div>
    );
  }
}

const mapStateToProps = ({ demo }: IRootState) => {
  const { list, loading } = demo;
  return { list, loading };
};

const mapDispatcherToProps = (dispatch: Dispatch<DemoActions>) => {
  return {
    addItem: (item: string) => dispatch(actions.addItemToList(item)),
  };
};

type ReduxType = ReturnType<typeof mapStateToProps> &
  ReturnType<typeof mapDispatcherToProps>;

export default connect(mapStateToProps, mapDispatcherToProps)(App);
