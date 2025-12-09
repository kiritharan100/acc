# ACC System CSS Setup Instructions

## Overview
This document describes the CSS architecture for the ACC (Accounting) system and provides instructions for maintaining and extending the styling framework.

## File Structure

```
acc/
├── assets/
│   └── css/
│       ├── style_acc.css      # Main ACC system styles
│       ├── main.css           # Core framework styles
│       └── responsive.css     # Responsive design styles
└── admin/
    ├── header.php             # Main header file (includes CSS)
    └── client_list.php        # Example page using ACC styles
```

## CSS Architecture

### 1. style_acc.css
**Location:** `assets/css/style_acc.css`
**Purpose:** Contains all custom styles for the ACC system
**Created:** October 30, 2025

This file is organized into the following sections:
- Table Styles
- Badge Styles  
- Button Styles
- Dropdown Styles
- Modal Styles
- Form Styles
- Card Styles
- VAT Details Styles
- DataTable Specific Styles
- Header Styles
- Utility Classes
- Responsive Design
- Animation Classes
- Print Styles

### 2. Integration with header.php
The CSS file is included in `admin/header.php` using:
```html
<!-- ACC System Custom Styles -->
<link rel="stylesheet" type="text/css" href="../assets/css/style_acc.css">
```

## Setup Instructions

### For New Development
1. **Always use the centralized CSS file** (`style_acc.css`) instead of inline styles
2. **Add new styles to appropriate sections** within style_acc.css
3. **Follow the existing naming conventions** and commenting structure
4. **Test responsive behavior** on multiple screen sizes

### Adding New Styles
1. Open `assets/css/style_acc.css`
2. Locate the appropriate section (or create a new one)
3. Add your CSS rules with proper comments
4. Test the changes across different pages

### Example of Adding New Styles
```css
/* ==========================================================================
   New Component Styles
   ========================================================================== */

.new-component {
    background-color: #f8f9fa;
    border-radius: 8px;
    padding: 15px;
}

.new-component .title {
    font-weight: 600;
    color: #495057;
}
```

## Style Guidelines

### 1. Naming Conventions
- Use **kebab-case** for CSS classes (e.g., `.modal-header`)
- Use **semantic names** that describe purpose, not appearance
- Prefix ACC-specific classes with `acc-` if needed

### 2. Color Palette
```css
Primary Colors:
- Main Background: #DED7D5
- Secondary Background: #DEDCDC
- Text Primary: #495057
- Text Secondary: #333
- Accent Blue: #667eea
- Success Green: #28a745
- Border Light: #e9ecef
- Border Medium: #dee2e6
```

### 3. Spacing System
```css
Padding/Margin Scale:
- xs: 4px
- sm: 8px
- md: 15px
- lg: 20px
- xl: 35px
```

### 4. Border Radius System
```css
Border Radius Scale:
- Small: 6px
- Medium: 8px
- Large: 12px
```

## Responsive Design

### Breakpoints
```css
Mobile: max-width: 768px
Tablet: 769px - 1024px
Desktop: 1025px+
```

### Mobile-First Approach
Always design for mobile first, then enhance for larger screens:
```css
.component {
    /* Mobile styles */
    padding: 8px;
}

@media (min-width: 769px) {
    .component {
        /* Tablet and desktop styles */
        padding: 15px;
    }
}
```

## Component Library

### 1. Tables
- `.table-responsive` - Responsive table wrapper
- `.table` - Basic table styling
- `.table th` - Header styling
- `.table td` - Cell styling
- `.table-hover` - Hover effects

### 2. Buttons
- `.btn` - Base button styling
- `.btn-sm` - Small button variant
- `.btn-success` - Success button styling

### 3. Modals
- `.modal-header` - Modal header styling
- `.modal-content` - Modal content wrapper
- `.modal-title` - Modal title styling

### 4. Forms
- `.form-control` - Input field styling
- `.col-form-label` - Form label styling
- `.form-check-input` - Checkbox/radio styling

### 5. Cards
- `.card` - Card container
- `.card-header` - Card header

## Maintenance

### Regular Tasks
1. **Review and optimize** unused CSS rules quarterly
2. **Update color variables** when design system changes
3. **Test responsive behavior** on new devices/screen sizes
4. **Validate CSS** using online validators

### Performance Considerations
1. **Minimize CSS file size** by removing unused rules
2. **Use CSS shorthand** properties where possible
3. **Avoid deep nesting** in selectors
4. **Group related styles** together

## Troubleshooting

### Common Issues
1. **Styles not applying:** Check if style_acc.css is properly included in header.php
2. **Responsive issues:** Verify viewport meta tag is present
3. **Specificity conflicts:** Use browser dev tools to check CSS cascade

### Browser Compatibility
The CSS is designed to work with:
- Chrome 70+
- Firefox 65+
- Safari 12+
- Edge 79+

## Future Development

### Planned Enhancements
1. **CSS Custom Properties** for better theming support
2. **CSS Grid Layout** for complex layouts
3. **Dark Mode Support** using CSS variables
4. **Animation Library** expansion

### Best Practices for Team Development
1. **Always use the central CSS file** - never add inline styles
2. **Comment your CSS** thoroughly
3. **Test on multiple browsers** before deployment
4. **Follow the established patterns** in the codebase
5. **Update this documentation** when making significant changes

## Contact
For questions about the CSS architecture or to suggest improvements, contact the development team.

---
**Last Updated:** October 30, 2025
**Version:** 1.0
**Maintained by:** Development Team