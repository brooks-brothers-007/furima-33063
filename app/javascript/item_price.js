function count (){  
  // 金額を入力した数値をpriceInputという変数に格納
  const priceInput = document.getElementById("item-price");
  // 入力するたびにイベントを発火できるようにする
  priceInput.addEventListener("input", () => {

    // input要素から実際に入力した金額の値を取得
    const inputValue = priceInput.value;

    // 販売手数料に書き換え、表示する
    const addTaxDom = document.getElementById("add-tax-price");
  
    // innerHTMLで、HTML要素の書き換えを行う。また、入力した金額をもとに販売手数料を計算する処理
    addTaxDom.innerHTML =  Math.floor(inputValue * 0.1);

    // 販売利益に書き換え、表示する
    const priceContent = document.getElementById("profit");
    
    // innerHTMLで、HTML要素の書き換えを行う。また、入力した金額をもとに販売手数料を計算する処理
    priceContent.innerHTML =  Math.floor(inputValue * 0.9);
  })
}

window.addEventListener('load', count);


