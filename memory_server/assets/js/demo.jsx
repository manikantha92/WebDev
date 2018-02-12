import React from 'react';
import ReactDOM from 'react-dom';
import {Button} from 'reactstrap';

export default function run_demo(root, channel) {
  ReactDOM.render(<Demo channel={channel}/>, root);
}

var cardCount = 0;
class Demo extends React.Component {
  constructor(props) {
    super(props);
    this.channel = props.channel;
    this.state = {
      initialGameState: [],
      count: 0
    };
    this.channel.join().receive("ok", this.gotView.bind(this)).receive("error", resp => {
      console.log("Unable to join", resp)
    });
  }

  isMatched() {
    this.channel.push("matched", {matched: "game"}).receive("ok", this.gotView.bind(this));
  }

  sendOpenCard(card) {
    cardCount = cardCount + 1;
    let newgame = this.channel.push("startGame", {card: card}).receive("ok", this.gotView.bind(this));
    if (cardCount == 2) {
      this.isMatched();
      cardCount = 0;
    }
  }

  resetMemory(mem) {
    this.channel.push("reset", {reset: "game"}).receive("ok", this.gotView.bind(this));
  }

  gotView(view) {
    console.log("New view", view);
    this.setState(view.game);
  }

  render() {
    //go to each row and access each of the values from the object
    let cardlist = this.state.initialGameState.map((cardrow, rowindex) => <tr key={rowindex}>
      {
        cardrow.map((card, i) => <td key={i} onClick={() => this.sendOpenCard(card)}>
          <div className={card.done
              ? "card done"
              : "card"}>
            <p>{
                card.flipped
                  ? card.value
                  : "?"
              }</p>
          </div>
        </td>)
      }
    </tr>);

    return (<div>
      <table>
        <tbody>
          {cardlist}
        </tbody>
      </table>
      <ShowClicks state={this.state}/>
      <button onClick={() => this.resetMemory(this)}>
        Reset
      </button>
    </div>);
  }
}

function ShowClicks(props) {
  let state = props.state;
  return <div class="clickCount">
    <p>Number of Clicks: {state.count}
    </p>
  </div>;
}

// Attriution:https://github.com/NatTuck/hangman2
