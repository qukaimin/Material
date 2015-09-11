//
// Copyright (C) 1615 GraphKit, Inc. <http://graphkit.io> and other GraphKit contributors.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published
// by the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program located at the root of the software package
// in a file called LICENSE.  If not, see <http://www.gnu.org/licenses/>.
//

import UIKit

public class BasicCardView : MaterialCardView, Comparable, Equatable {
	//
	//	:name:	layoutConstraints
	//
	internal lazy var layoutConstraints: Array<NSLayoutConstraint> = Array<NSLayoutConstraint>()
	
	//
	//	:name:	views
	//
	internal lazy var views: Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()
	
	/**
		:name:	titleLabelVerticalInset
	*/
	public var titleLabelVerticalInset: CGFloat = MaterialTheme.verticalInset {
		didSet {
			titleLabelTopInset = titleLabelVerticalInset
			titleLabelBottomInset = titleLabelVerticalInset
		}
	}
	
	/**
		:name:	titleLabelTopInset
	*/
	public var titleLabelTopInset: CGFloat = MaterialTheme.verticalInset {
		didSet {
			prepareCard()
		}
	}
	
	/**
		:name:	titleLabelBottomInset
	*/
	public var titleLabelBottomInset: CGFloat = 0 {
		didSet {
			prepareCard()
		}
	}
	
	/**
		:name:	titleLabelHorizontalInset
	*/
	public var titleLabelHorizontalInset: CGFloat = MaterialTheme.horizontalInset {
		didSet {
			titleLabelLeftInset = titleLabelHorizontalInset
			titleLabelRightInset = titleLabelHorizontalInset
		}
	}
	
	/**
		:name:	titleLabelLeftInset
	*/
	public var titleLabelLeftInset: CGFloat = MaterialTheme.horizontalInset {
		didSet {
			prepareCard()
		}
	}
	
	/**
		:name:	titleLabelRightInset
	*/
	public var titleLabelRightInset: CGFloat = MaterialTheme.horizontalInset {
		didSet {
			prepareCard()
		}
	}
	
	/**
		:name:	detailLabelVerticalInset
	*/
	public var detailLabelVerticalInset: CGFloat = MaterialTheme.verticalInset {
		didSet {
			detailLabelTopInset = detailLabelVerticalInset
			detailLabelBottomInset = detailLabelVerticalInset
		}
	}
	
	/**
		:name:	detailLabelTopInset
	*/
	public var detailLabelTopInset: CGFloat = MaterialTheme.verticalInset {
		didSet {
			prepareCard()
		}
	}
	
	/**
		:name:	detailLabelBottomInset
	*/
	public var detailLabelBottomInset: CGFloat = MaterialTheme.verticalInset {
		didSet {
			prepareCard()
		}
	}
	
	/**
		:name:	detailLabelHorizontalInset
	*/
	public var detailLabelHorizontalInset: CGFloat = MaterialTheme.horizontalInset {
		didSet {
			detailLabelLeftInset = detailLabelHorizontalInset
			detailLabelRightInset = detailLabelHorizontalInset
		}
	}
	
	/**
		:name:	detailLabelLeftInset
	*/
	public var detailLabelLeftInset: CGFloat = MaterialTheme.horizontalInset {
		didSet {
			prepareCard()
		}
	}
	
	/**
		:name:	detailLabelRightInset
	*/
	public var detailLabelRightInset: CGFloat = MaterialTheme.horizontalInset {
		didSet {
			prepareCard()
		}
	}
	
	/**
		:name:	buttonVerticalInset
	*/
	public var buttonVerticalInset: CGFloat = MaterialTheme.verticalInset {
		didSet {
			buttonTopInset = buttonVerticalInset
			buttonBottomInset = buttonVerticalInset
		}
	}
	
	/**
		:name:	buttonTopInset
	*/
	public var buttonTopInset: CGFloat = MaterialTheme.verticalInset / 2 {
		didSet {
			prepareCard()
		}
	}
	
	/**
		:name:	buttonBottomInset
	*/
	public var buttonBottomInset: CGFloat = MaterialTheme.verticalInset / 2 {
		didSet {
			prepareCard()
		}
	}
	
	/**
		:name:	buttonHorizontalInset
	*/
	public var buttonHorizontalInset: CGFloat = MaterialTheme.horizontalInset {
		didSet {
			buttonLeftInset = buttonHorizontalInset
			buttonRightInset = buttonHorizontalInset
		}
	}
	
	/**
		:name:	buttonLeftInset
	*/
	public var buttonLeftInset: CGFloat = MaterialTheme.horizontalInset / 2 {
		didSet {
			prepareCard()
		}
	}
	
	/**
		:name:	buttonRightInset
	*/
	public var buttonRightInset: CGFloat = MaterialTheme.horizontalInset / 2 {
		didSet {
			prepareCard()
		}
	}
	
	/**
		:name:	shadow
	*/
	public var shadow: Bool = true {
		didSet {
			false == shadow ? removeShadow() : prepareShadow()
			prepareCard()
		}
	}
	
	/**
		:name:	maximumImageViewHeight
	*/
	public var maximumImageViewHeight: CGFloat = 200 {
		didSet {
			prepareCard()
		}
	}
	
	/**
		:name:	maximumTitleLabelHeight
	*/
	public var maximumTitleLabelHeight: CGFloat = 0 {
		didSet {
			prepareCard()
		}
	}
	
	/**
		:name:	titleLabelContainer
	*/
	public private(set) var titleLabelContainer: UIView?
	
	/**
		:name:	titleLabel
	*/
	public var titleLabel: UILabel? {
		didSet {
			if let t = titleLabel {
				// container
				if nil == titleLabelContainer {
					titleLabelContainer = UIView()
					titleLabelContainer!.setTranslatesAutoresizingMaskIntoConstraints(false)
					titleLabelContainer!.backgroundColor = MaterialTheme.blueGrey.color
					addSubview(titleLabelContainer!)
				}
				
				// text
				titleLabelContainer!.addSubview(t)
				t.setTranslatesAutoresizingMaskIntoConstraints(false)
				t.backgroundColor = MaterialTheme.clear.color
				t.font = Roboto.medium
				t.numberOfLines = 0
				t.lineBreakMode = .ByTruncatingTail
				t.textColor = MaterialTheme.white.color
			} else {
				titleLabelContainer?.removeFromSuperview()
			}
			prepareCard()
		}
	}
	
	/**
		:name:	maximumDetailLabelHeight
	*/
	public var maximumDetailLabelHeight: CGFloat = 144 {
		didSet {
			prepareCard()
		}
	}
	
	/**
		:name:	detailLabelContainer
	*/
	public private(set) var detailLabelContainer: UIView?
	
	/**
		:name:	detailLabel
	*/
	public var detailLabel: UILabel? {
		didSet {
			if let l = detailLabel {
				// container
				if nil == detailLabelContainer {
					detailLabelContainer = UIView()
					detailLabelContainer!.setTranslatesAutoresizingMaskIntoConstraints(false)
					detailLabelContainer!.backgroundColor = MaterialTheme.blueGrey.color
					addSubview(detailLabelContainer!)
				}
				
				// text
				detailLabelContainer!.addSubview(l)
				l.setTranslatesAutoresizingMaskIntoConstraints(false)
				l.textColor = MaterialTheme.white.color
				l.backgroundColor = MaterialTheme.clear.color
				l.font = Roboto.light
				l.numberOfLines = 0
				l.lineBreakMode = .ByTruncatingTail
			} else {
				detailLabelContainer?.removeFromSuperview()
			}
			prepareCard()
		}
	}
	
	/**
		:name:	divider
	*/
	public var divider: UIView? {
		didSet {
			if let d = divider {
				d.setTranslatesAutoresizingMaskIntoConstraints(false)
				d.backgroundColor = MaterialTheme.blueGrey.darken1
				addSubview(d)
			} else {
				divider?.removeFromSuperview()
			}
			prepareCard()
		}
	}
	
	/**
		:name:	buttonsContainer
	*/
	public private(set) var buttonsContainer: UIView?
	
	/**
		:name:	leftButtons
	*/
	public var leftButtons: Array<MaterialButton>? {
		didSet {
			if let b = leftButtons {
				if nil == buttonsContainer {
					buttonsContainer = UIView()
					buttonsContainer!.setTranslatesAutoresizingMaskIntoConstraints(false)
					buttonsContainer!.backgroundColor = MaterialTheme.blueGrey.color
					addSubview(buttonsContainer!)
				}
			} else {
				buttonsContainer?.removeFromSuperview()
			}
			prepareCard()
		}
	}
	
	/**
		:name:	rightButtons
	*/
	public var rightButtons: Array<MaterialButton>? {
		didSet {
			if let b = rightButtons {
				if nil == buttonsContainer {
					buttonsContainer = UIView()
					buttonsContainer!.setTranslatesAutoresizingMaskIntoConstraints(false)
					buttonsContainer!.backgroundColor = MaterialTheme.blueGrey.color
					addSubview(buttonsContainer!)
				}
			} else {
				buttonsContainer?.removeFromSuperview()
			}
			prepareCard()
		}
	}
	
	/**
		:name:	init
	*/
	public required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	/**
		:name:	init
	*/
	public convenience init?(titleLabel: UILabel? = nil, detailLabel: UILabel? = nil, divider: UIView? = nil, leftButtons: Array<MaterialButton>? = nil, rightButtons: Array<MaterialButton>? = nil) {
		self.init(frame: CGRectZero)
		prepareProperties(titleLabel, detailLabel: detailLabel, divider: divider, leftButtons: leftButtons, rightButtons: rightButtons)
	}
	
	/**
		:name:	init
	*/
	public required init(frame: CGRect) {
		super.init(frame: CGRectZero)
	}
	
	//
	//	:name:	prepareProperties
	//
	internal func prepareProperties(titleLabel: UILabel?, detailLabel: UILabel?, divider: UIView?, leftButtons: Array<MaterialButton>?, rightButtons: Array<MaterialButton>?) {
		self.titleLabel = titleLabel
		self.detailLabel = detailLabel
		self.divider = divider
		self.leftButtons = leftButtons
		self.rightButtons = rightButtons
	}
	
	//
	//	:name:	prepareView
	//
	internal override func prepareView() {
		super.prepareView()
		prepareShadow()
		backgroundColor = MaterialTheme.clear.color
	}
	
	//
	//	:name:	prepareCard
	//
	internal override func prepareCard() {
		super.prepareCard()
		// clear all constraints
		NSLayoutConstraint.deactivateConstraints(layoutConstraints)
		layoutConstraints.removeAll(keepCapacity: false)
		
		// detect all components and create constraints
		var verticalFormat: String = "V:|"
		
		// title
		if nil != titleLabelContainer && nil != titleLabel {
			// clear for updated constraints
			titleLabelContainer!.removeConstraints(titleLabelContainer!.constraints())
			
			// container
			layoutConstraints += Layout.constraint("H:|[titleLabelContainer]|", options: nil, metrics: nil, views: ["titleLabelContainer": titleLabelContainer!])
			verticalFormat += "[titleLabelContainer]"
			views["titleLabelContainer"] = titleLabelContainer!
		
			// common text
			if 0 == maximumTitleLabelHeight {
				Layout.expandToParentWithPad(titleLabelContainer!, child: titleLabel!, top: titleLabelTopInset, left: titleLabelLeftInset, bottom: titleLabelBottomInset, right: titleLabelRightInset)
			} else {
				Layout.expandToParentHorizontallyWithPad(titleLabelContainer!, child: titleLabel!, left: titleLabelLeftInset, right: titleLabelRightInset)
				titleLabelContainer!.addConstraints(Layout.constraint("V:|-(titleLabelTopInset)-[titleLabel(<=maximumTitleLabelHeight)]-(titleLabelBottomInset)-|", options: nil, metrics: ["titleLabelTopInset": titleLabelTopInset, "titleLabelBottomInset": titleLabelBottomInset, "maximumTitleLabelHeight": maximumTitleLabelHeight], views: ["titleLabel": titleLabel!]))
			}
		}
		
		// detail
		if nil != detailLabelContainer && nil != detailLabel {
			// clear for updated constraints
			detailLabelContainer!.removeConstraints(detailLabelContainer!.constraints())
			
			// container
			layoutConstraints += Layout.constraint("H:|[detailLabelContainer]|", options: nil, metrics: nil, views: ["detailLabelContainer": detailLabelContainer!])
			verticalFormat += "[detailLabelContainer]"
			views["detailLabelContainer"] = detailLabelContainer!
			
			// text
			Layout.expandToParentHorizontallyWithPad(detailLabelContainer!, child: detailLabel!, left: detailLabelLeftInset, right: detailLabelRightInset)
			detailLabelContainer!.addConstraints(Layout.constraint("V:|-(detailLabelTopInset)-[detailLabel(<=maximumDetailLabelHeight)]-(detailLabelBottomInset)-|", options: nil, metrics: ["detailLabelTopInset": detailLabelTopInset, "detailLabelBottomInset": detailLabelBottomInset, "maximumDetailLabelHeight": maximumDetailLabelHeight], views: ["detailLabel": detailLabel!]))
		}
		
		// buttons
		if nil != buttonsContainer && (nil != leftButtons || nil != rightButtons) {
			// clear for updated constraints
			buttonsContainer!.removeConstraints(buttonsContainer!.constraints())
			
			// divider
			if nil != divider {
				layoutConstraints += Layout.constraint("H:|[divider]|", options: nil, metrics: nil, views: ["divider": divider!])
				views["divider"] = divider!
				verticalFormat += "[divider(1)]"
			}
			
			//container
			layoutConstraints += Layout.constraint("H:|[buttonsContainer]|", options: nil, metrics: nil, views: ["buttonsContainer": buttonsContainer!])
			verticalFormat += "[buttonsContainer]"
			views["buttonsContainer"] = buttonsContainer!
			
			// leftButtons
			if nil != leftButtons {
				var horizontalFormat: String = "H:|"
				var buttonViews: Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()
				for var i: Int = 0, l: Int = leftButtons!.count; i < l; ++i {
					let button: MaterialButton = leftButtons![i]
					buttonsContainer!.addSubview(button)
					buttonViews["button\(i)"] = button
					horizontalFormat += "-(buttonLeftInset)-[button\(i)]"
					Layout.expandToParentVerticallyWithPad(buttonsContainer!, child: button, top: buttonTopInset, bottom: buttonBottomInset)
				}
				buttonsContainer!.addConstraints(Layout.constraint(horizontalFormat, options: nil, metrics: ["buttonLeftInset": buttonLeftInset], views: buttonViews))
			}
			
			// rightButtons
			if nil != rightButtons {
				var horizontalFormat: String = "H:"
				var buttonViews: Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()
				for var i: Int = 0, l: Int = rightButtons!.count; i < l; ++i {
					let button: MaterialButton = rightButtons![i]
					buttonsContainer!.addSubview(button)
					buttonViews["button\(i)"] = button
					horizontalFormat += "[button\(i)]-(buttonRightInset)-"
					Layout.expandToParentVerticallyWithPad(buttonsContainer!, child: button, top: buttonTopInset, bottom: buttonBottomInset)
				}
				buttonsContainer!.addConstraints(Layout.constraint(horizontalFormat + "|", options: nil, metrics: ["buttonRightInset": buttonRightInset], views: buttonViews))
			}
		}
		
		verticalFormat += "|"
		
		// combine constraints
		if 0 < layoutConstraints.count {
			layoutConstraints += Layout.constraint(verticalFormat, options: nil, metrics: nil, views: views)
			NSLayoutConstraint.activateConstraints(layoutConstraints)
		}
	}
}

public func ==(lhs: BasicCardView, rhs: BasicCardView) -> Bool {
	return lhs.tag == rhs.tag
}

public func <=(lhs: BasicCardView, rhs: BasicCardView) -> Bool {
	return lhs.tag <= rhs.tag
}

public func >=(lhs: BasicCardView, rhs: BasicCardView) -> Bool {
	return lhs.tag >= rhs.tag
}

public func >(lhs: BasicCardView, rhs: BasicCardView) -> Bool {
	return lhs.tag > rhs.tag
}

public func <(lhs: BasicCardView, rhs: BasicCardView) -> Bool {
	return lhs.tag < rhs.tag
}
